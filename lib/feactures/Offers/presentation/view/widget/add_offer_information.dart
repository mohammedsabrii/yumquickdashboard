import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';

class AddOfferInformation extends StatelessWidget {
  const AddOfferInformation({
    super.key,
    this.pickedImage,
    required this.onImagePicked,
    required this.onNameChanged,
    required this.onDescriptionChanged,
    required this.onPriceChanged,
    required this.onDiscountPriceChanged,
  });
  final XFile? pickedImage;
  final VoidCallback onImagePicked;
  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final Function(String) onPriceChanged;
  final Function(String) onDiscountPriceChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            CustomTextFiled(
              onChanged: onNameChanged,
              helperText: 'Product Name',
              hintText: 'Add Product Name',
            ),
            SizedBox(height: 24),
            SizedBox(height: 24),
            CustomTextFiled(
              onChanged: onDescriptionChanged,
              height: 100,
              maxLines: 10,
              helperText: 'Product description',
              hintText: 'Add Product description',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Text(
              'Images',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            PickImage(onImagePicked: onImagePicked, pickedImage: pickedImage),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Text(
              'Price',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CustomTextFiled(
                  onChanged: onPriceChanged,
                  helperText: 'Prodact Price',
                  hintText: 'Enter price',
                  width: MediaQuery.sizeOf(context).width * 0.22,
                ),
                SizedBox(width: 20),
                CustomTextFiled(
                  onChanged: onDiscountPriceChanged,
                  helperText: 'Discount Price',
                  hintText: 'Price at Discount',
                  width: MediaQuery.sizeOf(context).width * 0.22,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.012),
          ],
        ),
      ),
    );
  }
}
