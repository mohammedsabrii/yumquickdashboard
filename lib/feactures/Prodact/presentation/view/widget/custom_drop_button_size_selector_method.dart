import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

Expanded customDropButtonSizeSelector(
  BuildContext context, {
  onChanged,
  items,
  value,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const SizedBox(height: 4),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.243,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            elevation: 0,
            value: value,
            hint: const Text('Size'),
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    ),
  );
}
