import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/service/get_completed_orders_service.dart';

import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/Oredrs_over_time_item_details.dart';
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
        child: OredrsOverTimeItemBlocBuilder(),
      ),
    );
  }
}

class OredrsOverTimeItemBlocBuilder extends StatelessWidget {
  const OredrsOverTimeItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStatsCubit, AppStatsState>(
      builder: (context, state) {
        if (state is AppStatsSuccess) {
          return OredrsOverTimeItemDetails(stats: state.stats);
        } else if (state is AppStateFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
