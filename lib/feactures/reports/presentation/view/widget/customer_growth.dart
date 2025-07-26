import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_drop_button.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/customer_growth_chart.dart';

class CustomerGrowth extends StatelessWidget {
  const CustomerGrowth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
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
            Row(
              children: [
                Text(
                  'Customer Growth',
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Spacer(),
                CustomDropButton(),
              ],
            ),
            Row(
              children: [
                CustomChartTitle(
                  color: Colors.grey,
                  title: 'Returning customers',
                ),
                SizedBox(width: 20),
                CustomChartTitle(
                  color: AppColor.kMainColor,
                  title: 'New customers',
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.038),
            CustomerGrowthChart(),
          ],
        ),
      ),
    );
  }
}

class CustomChartTitle extends StatelessWidget {
  const CustomChartTitle({super.key, required this.color, required this.title});
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
