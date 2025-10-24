import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_show_snackbar.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/on_track_cubit/on_track_cubit.dart';

class OrderMoreDeitlsDialogActions extends StatelessWidget {
  const OrderMoreDeitlsDialogActions({
    super.key,
    required this.activeOrderEntity,
  });
  final OrderEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Change state to',
          style: AppStayls.styleInterBold16(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        SizedBox(height: 10),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocListener<ActiveOrdersCubit, ActiveOrdersState>(
              listener: (context, state) {
                if (state is ActiveOrdersSuccess) {
                  customShowSnackBar(
                    context,
                    title: 'Order moved successfully',
                  );
                } else if (state is ActiveOrdersFailure) {
                  customShowSnackBar(context, title: state.errorMessage);
                }
              },
              child: CustomButtom(
                width: mq.width * 0.0625,
                title: 'On Track',
                backgroundColor: AppColor.kMainColor,
                textColor: AppColor.kCultured,
                onTap: () {
                  BlocProvider.of<ActiveOrdersCubit>(
                    context,
                  ).moveOrderToOnTrackTable(
                    context,
                    activeOrderEntity.product.id,
                    activeOrderEntity,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ),
            BlocListener<OnTrackCubit, OnTrackState>(
              listener: (context, state) {
                if (state is OnTrackSuccess) {
                  customShowSnackBar(
                    context,
                    title: 'Order moved successfully',
                  );
                } else if (state is OnTrackFailure) {
                  customShowSnackBar(context, title: state.errorMessage);
                }
              },
              child: CustomButtom(
                width: mq.width * 0.0833,
                title: 'Completed',
                backgroundColor: AppColor.kMainColor,
                textColor: AppColor.kCultured,
                onTap: () {
                  BlocProvider.of<OnTrackCubit>(
                    context,
                  ).moveOrderToCompletedTable(
                    context,
                    activeOrderEntity.product.id,
                    activeOrderEntity,
                  );
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
