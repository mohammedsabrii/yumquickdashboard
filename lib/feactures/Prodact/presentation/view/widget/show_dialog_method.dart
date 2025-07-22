import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

Future<String?> showDialogMethod(
  BuildContext context,
  List<String> remainingSizes,
) async {
  String? selected = await showDialog<String>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        elevation: 0,
        backgroundColor: AppColor.kMainColor,
        title: Text(
          'Add Size',
          style: AppStayls.styleInterBold20(
            context,
          ).copyWith(color: Colors.white),
        ),
        children:
            remainingSizes.map((size) {
              return SimpleDialogOption(
                child: Text(
                  size,
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: Colors.white, fontSize: 14),
                ),
                onPressed: () => Navigator.pop(context, size),
              );
            }).toList(),
      );
    },
  );
  return selected;
}
