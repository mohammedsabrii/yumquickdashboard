import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/get_top_selling_cubit/get_top_selling_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/last_7_days_sales.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/oredrs_over_time_item.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/recent_transactions.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/statistics_item_list.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  Timer? refreshTimer;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AppStatsCubit>(context).fetchAppStats();
    BlocProvider.of<GetTopSellingCubit>(context).getTopSelling();

    refreshTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      BlocProvider.of<AppStatsCubit>(context).fetchAppStatsSilently();
      BlocProvider.of<GetTopSellingCubit>(context).fetchTopSellingSilently();
    });
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0325,
          horizontal: MediaQuery.sizeOf(context).width * 0.0277,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: AppStayls.styleInterBold24(context)),
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
