import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/simple_bar_chart.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/total_item.dart';

class Last7DaysSales extends StatelessWidget {
  const Last7DaysSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.177,
        height: MediaQuery.sizeOf(context).height * 0.586,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.035,
            horizontal: MediaQuery.sizeOf(context).width * 0.0194,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last 7 Days Sales',
                style: AppStayls.styleInterBold16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              TotalItem(totalOrders: '1,259', title: 'Items Sold'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
              TotalItem(totalOrders: r'$12,546', title: 'Revenue'),
              Divider(thickness: 2, color: Colors.grey),
              Flexible(child: SimpleBarChart()),
            ],
          ),
        ),
      ),
    );
  }
}
