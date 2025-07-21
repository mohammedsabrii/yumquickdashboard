import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? imageFile;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // or ImageSource.camera
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

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
            imageFile != null
                ? Image.file(
                  imageFile!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )
                : Text('No image selected.'),
            SizedBox(height: 10),
            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: 102,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.kPinkishOrange,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Add File',
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
