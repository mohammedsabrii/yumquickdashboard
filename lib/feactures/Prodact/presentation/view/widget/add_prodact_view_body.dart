import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_cargorys.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_information.dart';

class AddProdactViewBody extends StatefulWidget {
  const AddProdactViewBody({super.key, required this.onClose});
  final VoidCallback onClose;

  @override
  State<AddProdactViewBody> createState() => _AddProdactViewBodyyState();
}

class _AddProdactViewBodyyState extends State<AddProdactViewBody> {
  final formKey = GlobalKey<FormState>();
  XFile? pickedImage;
  String? prodactName, description, price, discountPrice, id;

  bool isLoading = false;
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
    return BlocConsumer<AddProdactCubit, AddProdactState>(
      listener: (context, state) {
        if (state is AddProdactSuccess) {
          customShowSnackBar(context, title: 'Successfully added product');
          isLoading = false;
        } else if (state is AddProdactFailure) {
          customShowSnackBar(context, title: state.errorMassage);
          isLoading = false;
        } else if (state is AddProdactLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            color: AppColor.kMainColor,
          ),
          inAsyncCall: isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.018,
              horizontal: MediaQuery.sizeOf(context).width * 0.027,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAddedHeader(
                      onSave: () {
                        BlocProvider.of<AddProdactCubit>(context).addProduct(
                          context,
                          id: id ?? '',
                          name: prodactName ?? '',
                          subtitle: description ?? '',
                          price: double.tryParse(price ?? '') ?? 0.0,
                          priceAfterDiscount:
                              double.tryParse(discountPrice ?? '') ?? 0.0,

                          imageFile: pickedImage,
                        );
                      },
                      onClose: widget.onClose,
                      title: 'Add Product',
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: MediaQuery.sizeOf(context).width * 0.02,
                      children: [
                        AddProdactInformation(
                          pickedImage: pickedImage,
                          onImagePicked: () => pickImage(),
                          onNameChanged:
                              (value) => setState(() => prodactName = value),
                          onDescriptionChanged:
                              (value) => setState(() => description = value),
                          onPriceChanged:
                              (value) => setState(() => price = value),
                          onDiscountPriceChanged:
                              (value) => setState(() => discountPrice = value),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 20,
                            children: [AddProdactCargorys()],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
