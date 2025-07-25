import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomerNameCountryTotalOrdersAndJoiningDate extends StatelessWidget {
  const CustomerNameCountryTotalOrdersAndJoiningDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: ShapeDecoration(
            color: const Color(0xFFA1A7C4),
            shape: OvalBorder(),
          ),
          child: Center(
            child: Text(
              'R',
              textAlign: TextAlign.center,
              style: AppStayls.styleInterBold32(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Randhir Kumar',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 8),
            Text(
              'India\n5 Orders\nCustomer for 2 years',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
