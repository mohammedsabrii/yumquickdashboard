import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/last_7_days_sales_details.dart';

class Last7DaysSalesBlocBuilder extends StatelessWidget {
  const Last7DaysSalesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStatsCubit, AppStatsState>(
      builder: (context, state) {
        if (state is AppStatsSuccess) {
          return Last7DaysSalesDetails(stats: state.stats);
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
