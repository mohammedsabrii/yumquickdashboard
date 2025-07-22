import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

Expanded customSelectedValues(
  BuildContext context, {
  required List<String> selectedSizes,
  removeSize,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Value',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        const SizedBox(height: 4),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.243,

          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child:
              selectedSizes.isEmpty
                  ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(3.5),
                      child: Text(
                        'Add size',
                        style: AppStayls.styleInterRegular16(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ),
                  )
                  : Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        selectedSizes.map((size) {
                          return SizedBox(
                            height: 30,
                            child: Chip(
                              label: Text(
                                size,
                                style: const TextStyle(color: Colors.black87),
                              ),
                              backgroundColor: Colors.grey.shade200,
                              deleteIcon: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.grey,
                              ),
                              onDeleted: () => removeSize(size),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
        ),
      ],
    ),
  );
}
