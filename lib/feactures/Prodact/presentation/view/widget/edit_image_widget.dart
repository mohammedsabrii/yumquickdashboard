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
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20),
        PickImage(onImagePicked: onImagePicked, pickedImage: pickedImage),
      ],
    );
  }
}
