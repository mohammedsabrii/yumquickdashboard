import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/app_state_cubit/app_state_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/item_method.dart';
import 'package:yumquickdashboard/core/widget/statistics_item.dart';

class StatisticsItemList extends StatelessWidget {
  const StatisticsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStatsCubit, AppStatsState>(
      builder: (context, state) {
        if (state is AppStatsSuccess) {
          return Row(
            spacing: 10,
            children: List.generate(
              itemMethod(context, appStatsEntity: state.stats).length,
              (index) {
                return StatisticsItem(
                  statisticsItemModel:
                      itemMethod(context, appStatsEntity: state.stats)[index],
                );
              },
            ),
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
    );
  }
}
