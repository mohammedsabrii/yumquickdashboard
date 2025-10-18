import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/on_track_cubit/on_track_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/on_track_order_more_details_dialog.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_empty.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_table.dart';

class OnTrackBlocBulider extends StatelessWidget {
  const OnTrackBlocBulider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTrackCubit, OnTrackState>(
      builder: (context, state) {
        if (state is OnTrackSuccess) {
          return OrderTable(
            activeOrderEntity: state.onTrackOrders,
            detailsDialog:
                (context, index) => OnTrackOrderMoreDetailsDialog(
                  id: state.onTrackOrders[index].id!,
                  activeOrderEntity: state.onTrackOrders[index],
                ),
          );
        } else if (state is OnTrackFailure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleLeagueSpartanMediem17(
              context,
            ).copyWith(color: Colors.red),
          );
        } else if (state is OnTrackEmpty) {
          return Center(child: OrderEmpty());
        }
        return Center(
          child: CircularProgressIndicator(color: AppColor.kMainColor),
        );
      },
    );
  }
}
