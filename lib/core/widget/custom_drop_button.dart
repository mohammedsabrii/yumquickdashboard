import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomDropButton extends StatefulWidget {
  const CustomDropButton({super.key});

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: Text(
          'Filter',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
        elevation: 0,
        dropdownColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16),
        value: selectedValue,
        items: [
          DropdownMenuItem(
            value: 'Option 1',
            child: Text(
              'Option 1',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
          DropdownMenuItem(
            value: 'Option 2',
            child: Text(
              'Option 2',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
          DropdownMenuItem(
            value: 'Option 3',
            child: Text(
              'Option 3',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
      ),
    );
  }
}
