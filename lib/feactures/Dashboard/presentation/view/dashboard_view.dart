import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/dashboard_header.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/last_7_days_sales.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/oredrs_over_time_item.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/recent_transactions.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/statistics_item_list.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.0325,
        horizontal: MediaQuery.sizeOf(context).width * 0.0277,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardHeader(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
            StatisticsItemList(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
            Row(
              children: [
                OredrsOverTimeItem(),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02083),
                Last7DaysSales(),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
            Row(
              children: [
                RecentTransactions(),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02083),
                TopProductsByUnitsSold(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
