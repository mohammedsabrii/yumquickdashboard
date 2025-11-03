import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/orders_over_time_chart.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/total_item.dart';

class OredrsOverTimeItemDetails extends StatelessWidget {
  const OredrsOverTimeItemDetails({super.key, required this.stats});
  final AppStatsEntity stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Orders Over Time',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            Spacer(),
            Text(
              'Last 24 Hours',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        Row(
          children: [
            TotalItem(
              title: 'Orders in Last 24 Hours',
              totalOrders: stats.itemsSoldLast24Hours.toString(),
            ),
            Spacer(),
            TotalItem(
              title: 'Revenue in Last 24 Hours',
              totalOrders: '\$${stats.revenueLast24Hours}',
            ),
          ],
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
        Flexible(
          child: OrdersOverTimeChart(
            itemsSoldPerHour: stats.itemsSoldPerHourList,
          ),
        ),
      ],
    );
  }
}
