import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled({
    super.key,
    required this.helperText,
    required this.hintText,
    this.height,
    this.width,
    this.onSubmitted,
    this.controller,
    this.maxLines,
  });
  final String helperText, hintText;
  final double? height, width;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final int? maxLines;
  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.helperText,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        SizedBox(height: 4),
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
          child: TextField(
            controller: widget.controller,
            maxLines: widget.maxLines ?? 1,
            cursorColor: AppColor.kDarkRed,
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              hintText: widget.hintText,

              hintStyle: AppStayls.styleInterRegular16(
                context,
              ).copyWith(color: Colors.grey),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
