import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class OrderMoreDeitlsDialogItem extends StatelessWidget {
  const OrderMoreDeitlsDialogItem({
    super.key,
    required this.title,
    required this.info,
  });
  final String title, info;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStayls.styleInterBold18(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        SizedBox(height: 10),
        Container(
          height: mq.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.kPinkishOrange,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                info,
                style: AppStayls.styleInterBold16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
