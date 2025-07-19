import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.113,
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.kMainColor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+',
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: Colors.white, fontSize: 24),
          ),
          SizedBox(width: 5),
          Text(
            title,
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
