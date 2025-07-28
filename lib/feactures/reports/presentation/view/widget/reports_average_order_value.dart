import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/average_order_value_line_chart.dart';

class ReportsAverageOrderValue extends StatelessWidget {
  const ReportsAverageOrderValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.375,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.019,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Average Order Value',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'This Month ',
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
                SizedBox(width: 8),
                Text(
                  '\$48.90',
                  style: AppStayls.styleInterBold14(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                SizedBox(width: 20),
                Text(
                  'Previous Month ',
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
                SizedBox(width: 8),

                Text(
                  '\$48.90',
                  style: AppStayls.styleInterBold14(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AverageOrderValueLineChart(),
          ],
        ),
      ),
    );
  }
}
