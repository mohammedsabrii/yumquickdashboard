import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/orders_over_time_chart.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/total_item.dart';

class OredrsOverTimeItem extends StatelessWidget {
  const OredrsOverTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.57,
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
        child: BlocBuilder<AppStatsCubit, AppStatsState>(
          builder: (context, state) {
            if (state is AppStatsSuccess) {
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
                        textAlign: TextAlign.right,
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
                        totalOrders:
                            state.stats.itemsSoldLast24Hours.toString(),
                      ),
                      Spacer(),
                      TotalItem(
                        title: 'Revnue in Last 24 Hours',
                        totalOrders: '\$${state.stats.revenueLast24Hours}',
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
                  Flexible(
                    child: OrdersOverTimeChart(
                      itemsSoldPerHour: state.stats.itemsSoldPerHour,
                    ),
                  ),
                ],
              );
            } else if (state is AppStateFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          },
        ),
      ),
    );
  }
}
