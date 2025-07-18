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
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).width * 0.125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            'Filter',
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: Colors.grey),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          value: selectedValue,
          items: [
            DropdownMenuItem(
              value: 'Option 1',
              child: Text(
                'Option 1',
                style: AppStayls.styleInterRegular16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ),
            DropdownMenuItem(
              value: 'Option 2',
              child: Text(
                'Option 2',
                style: AppStayls.styleInterRegular16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ),
            DropdownMenuItem(
              value: 'Option 3',
              child: Text(
                'Option 3',
                style: AppStayls.styleInterRegular16(
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
      ),
    );
  }
}
