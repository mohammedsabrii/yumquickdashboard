import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';

class EditProductItem extends StatelessWidget {
  const EditProductItem({
    super.key,
    this.onChanged,
    this.height,
    this.maxLines,
    this.helperText,
    this.hintText,
    this.initialValue,
    this.initialValueName,
  });
  final Function(String)? onChanged;
  final double? height;
  final int? maxLines;
  final String? helperText;
  final String? hintText;
  final String? initialValue;
  final String? initialValueName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                initialValueName ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              Text(
                initialValue ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.25,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomTextFiled(
              onChanged: onChanged,
              height: height,
              maxLines: maxLines,
              helperText: helperText ?? '',
              hintText: hintText ?? '',
            ),
          ),
        ),
      ],
    );
  }
}
