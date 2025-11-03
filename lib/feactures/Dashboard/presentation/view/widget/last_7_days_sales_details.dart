import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/simple_bar_chart.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/total_item.dart';

class Last7DaysSalesDetails extends StatelessWidget {
  const Last7DaysSalesDetails({super.key, required this.stats});
  final AppStatsEntity stats;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last 7 Days Sales',
          style: AppStayls.styleInterBold16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        TotalItem(
          title: 'Items Sold',
          totalOrders: stats.itemsSoldLast7Days.toString(),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
        TotalItem(title: 'Revenue', totalOrders: '\$${stats.revenueLast7Days}'),
        Divider(thickness: 2, color: Colors.grey),
        Flexible(
          child: SimpleBarChart(
            itemsSoldLast7Days: stats.itemsSoldPerDayLast7DaysList,
          ),
        ),
      ],
    );
  }
}
