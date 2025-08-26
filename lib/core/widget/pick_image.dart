import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key, this.onImagePicked, this.pickedImage});
  final XFile? pickedImage;
  final VoidCallback? onImagePicked;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        strokeWidth: 2,
        padding: EdgeInsets.all(35),
        color: Colors.grey,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedImage != null
                ? Image.network(
                  pickedImage!.path,
                  height: 200,
                  fit: BoxFit.cover,
                )
                : Text('No image selected.'),
            SizedBox(height: 10),
            pickedImage != null
                ? SizedBox(height: 10)
                : GestureDetector(
                  onTap: onImagePicked,
                  child: Container(
                    width: 102,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.kPinkishOrange,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        'Add Image',
                        style: AppStayls.styleInterRegular16(
                          context,
                        ).copyWith(color: AppColor.kMainColor),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
