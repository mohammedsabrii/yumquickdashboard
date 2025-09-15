import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/manger/cubit/offers_cubit/offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/add_offer_category.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/add_offer_information.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';

class AddOfferViewBody extends StatefulWidget {
  const AddOfferViewBody({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  State<AddOfferViewBody> createState() => _AddOfferViewBodyState();
}

class _AddOfferViewBodyState extends State<AddOfferViewBody> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  XFile? pickedImage;

  String? subaTitle, price, discountPrice, productName, offerTitle;
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
    return BlocConsumer<AddOffersCubit, AddOffersState>(
      listener: (context, state) {
        if (state is AddOffersLoading) {
          isLoading = true;
        } else if (state is AddOffersSuccess) {
          customShowSnackBar(context, title: 'Successfully added offer');
          isLoading = false;
        } else if (state is AddOffersFailure) {
          customShowSnackBar(context, title: state.errorMessage);
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
                        BlocProvider.of<AddOffersCubit>(context).addOffers(
                          productName: productName ?? '',
                          offerTitle: offerTitle ?? '',
                          subtitle: subaTitle ?? '',
                          price: double.tryParse(price ?? '') ?? 0.0,
                          priceAfterDiscount:
                              double.tryParse(discountPrice ?? '') ?? 0.0,

                          imageFile: pickedImage,
                        );
                      },
                      onCancel: widget.onClose,
                      onClose: widget.onClose,
                      title: 'Add Product',
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: MediaQuery.sizeOf(context).width * 0.02,
                      children: [
                        AddOfferInformation(
                          pickedImage: pickedImage,
                          onImagePicked: () => pickImage(),
                          onNameChanged:
                              (value) => setState(() => productName = value),
                          onOfferTitleChanged:
                              (value) => setState(() => offerTitle = value),
                          onDescriptionChanged:
                              (value) => setState(() => subaTitle = value),
                          onPriceChanged:
                              (value) => setState(() => price = value),
                          onDiscountPriceChanged:
                              (value) => setState(() => discountPrice = value),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 20,
                            children: [AddOfferCargorys()],
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
