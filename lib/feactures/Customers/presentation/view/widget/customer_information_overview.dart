import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class CustomerInformationOverview extends StatelessWidget {
  const CustomerInformationOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Overview',
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Spacer(),
                Text(
                  'Edit',
                  textAlign: TextAlign.right,
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: const Color(0xFF1E5EFF)),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
            Text(
              'Address',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            SizedBox(height: 7),
            Text(
              'Panapur langa\nHajipur,vaishali\n844124\nIndia',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
            Text(
              'Email Address',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            Text(
              'randhirppl@gmail.com',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
            Text(
              'Phone',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            Text(
              '+91 8804789764',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
            Divider(color: Colors.grey),
            Text(
              'Delete Customer',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: const Color(0xFFEF142F)),
            ),
          ],
        ),
      ),
    );
  }
}
