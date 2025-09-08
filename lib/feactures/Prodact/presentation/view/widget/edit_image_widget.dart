import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({
    super.key,
    required this.onImagePicked,
    this.pickedImage,
    required this.imageUrl,
  });
  final Function() onImagePicked;
  final XFile? pickedImage;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current product image',

              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 10),
            Image.network(imageUrl, height: 100, fit: BoxFit.cover),
          ],
        ),
        SizedBox(width: 20),
        PickImage(onImagePicked: onImagePicked, pickedImage: pickedImage),
      ],
    );
  }
}
