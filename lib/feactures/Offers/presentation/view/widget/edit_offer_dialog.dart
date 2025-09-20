import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Offers/entity/offers_entity.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/manger/cubit/edit_offer_cubit/edit_offer_cubit.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/manger/cubit/get_offers_cubit/get_offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_image_widget.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_item.dart';

class EditOfferDialog extends StatefulWidget {
  const EditOfferDialog({super.key, required this.offersEntity});
  final OffersEntity offersEntity;
  @override
  State<EditOfferDialog> createState() => _EditOfferDialogState();
}

class _EditOfferDialogState extends State<EditOfferDialog> {
  String? subaTitle, price, discountPrice, productName, offerTitle;
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
    return BlocConsumer<EditOfferCubit, EditOfferState>(
      listener: (context, state) {
        if (state is EditOfferSuccess) {
          Navigator.of(context).pop();
          BlocProvider.of<GetOffersCubit>(context).getOffers();
          customShowSnackBar(context, title: 'Successfully Edit Offer');
        } else if (state is EditOfferFailure) {
          Navigator.of(context).pop();
          customShowSnackBar(context, title: state.errorMessage);
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
                            (value) => setState(() => productName = value),
                        initialValue: widget.offersEntity.productName,
                        initialValueName: 'Current Product Name',
                        helperText: 'Product Name',
                        hintText: 'Edit Product Name',
                      ),
                      EditProductItem(
                        onChanged:
                            (value) => setState(() => offerTitle = value),
                        initialValue: widget.offersEntity.offerName,
                        initialValueName: 'Current Offer Title',
                        helperText: 'Offer Title',
                        hintText: 'Edit Offer Title',
                      ),
                      EditProductItem(
                        onChanged: (value) => setState(() => subaTitle = value),
                        initialValue: widget.offersEntity.subtitle,
                        height: 50,
                        maxLines: 10,
                        initialValueName: 'Current Product Description',
                        helperText: 'Product Description',
                        hintText: 'Add Product Description',
                      ),
                      EditProductItem(
                        onChanged: (value) => setState(() => price = value),
                        initialValue: widget.offersEntity.price.toString(),
                        initialValueName: 'Current Product Price',
                        helperText: 'Prodact Price',
                        hintText: 'Enter New Price',
                      ),
                      EditProductItem(
                        onChanged:
                            (value) => setState(() => discountPrice = value),
                        initialValue:
                            widget.offersEntity.priceAfterDiscount.toString(),
                        initialValueName: 'Current Product Discount Price',
                        helperText: 'Discount Price',
                        hintText: 'Price at Discount',
                      ),
                      EditImageWidget(
                        onImagePicked: () => pickImage(),
                        imageUrl: widget.offersEntity.image,
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
                BlocProvider.of<EditOfferCubit>(context).editOffer(
                  image: pickedImage,
                  id: widget.offersEntity.id,
                  productName: productName ?? widget.offersEntity.productName,
                  offerTitle: offerTitle ?? widget.offersEntity.offerName,

                  subtitle: subaTitle ?? widget.offersEntity.subtitle,
                  price: price ?? widget.offersEntity.price.toString(),
                  priceAfterDiscount:
                      discountPrice ??
                      widget.offersEntity.priceAfterDiscount.toString(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
