import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/Oredrs_over_time_item_details.dart';

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
