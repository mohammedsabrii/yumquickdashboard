import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomersCategory extends StatelessWidget {
  const CustomersCategory({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Text(
        title,
        style: AppStayls.styleInterRegular16(
          context,
        ).copyWith(color: Colors.grey),
      ),
    );
  }
}
