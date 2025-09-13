import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_image_widget.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_item.dart';

class EditProductDialog extends StatefulWidget {
  const EditProductDialog({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  String? prodactName, description, price, discountPrice;
  XFile? pickedImage;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        pickedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is EditProductSuccess) {
          Navigator.of(context).pop();
          BlocProvider.of<ProductsCubit>(context).loadProducts();
          customShowSnackBar(context, title: 'Successfully edit product');
        } else if (state is EditProductFailure) {
          Navigator.of(context).pop();
          customShowSnackBar(context, title: state.errorMassage);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: AppColor.kBackGroundColor,
          title: Text(
            'Edit product',
            style: AppStayls.styleInterBold20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          content: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.sizeOf(context).width * 0.5,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.02,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      EditProductItem(
                        onChanged:
                            (value) => setState(() => prodactName = value),
                        initialValue: widget.productEntity.name,
                        initialValueName: 'Current product name',
                        helperText: 'Product Name',
                        hintText: 'Add Product Name',
                      ),
                      EditProductItem(
                        onChanged:
                            (value) => setState(() => description = value),
                        initialValue: widget.productEntity.subtitle,
                        height: 50,
                        maxLines: 10,
                        initialValueName: 'Current product description',
                        helperText: 'Product description',
                        hintText: 'Add Product description',
                      ),
                      EditProductItem(
                        onChanged: (value) => setState(() => price = value),
                        initialValue: widget.productEntity.price.toString(),
                        initialValueName: 'Current product price',
                        helperText: 'Prodact Price',
                        hintText: 'Enter price',
                      ),
                      EditProductItem(
                        onChanged:
                            (value) => setState(() => discountPrice = value),
                        initialValue:
                            widget.productEntity.priceAfterDiscount.toString(),
                        initialValueName: 'Current product discount price',
                        helperText: 'Discount Price',
                        hintText: 'Price at Discount',
                      ),
                      EditImageWidget(
                        onImagePicked: () => pickImage(),
                        imageUrl: widget.productEntity.image,
                        pickedImage: pickedImage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            CustomButtom(
              title: 'Cancel',
              backgroundColor: AppColor.kPinkishOrange,
              textColor: AppColor.kMainColor,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            CustomButtom(
              title: 'Save',
              backgroundColor: AppColor.kMainColor,
              textColor: AppColor.kCultured,
              onTap: () {
                BlocProvider.of<EditProductCubit>(context).editProduct(
                  image: pickedImage,
                  id: widget.productEntity.id,
                  name: prodactName ?? widget.productEntity.name,
                  subtitle: description ?? widget.productEntity.subtitle,
                  price: price ?? widget.productEntity.price.toString(),
                  priceAfterDiscount:
                      discountPrice ??
                      widget.productEntity.priceAfterDiscount.toString(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
