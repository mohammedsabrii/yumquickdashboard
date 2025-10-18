import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/on_track_cubit/on_track_cubit.dart';

class OnTrackOrderMoreDetailsDialogActions extends StatelessWidget {
  const OnTrackOrderMoreDetailsDialogActions({
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomButtom(
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
              },
            ),
          ],
        ),
      ],
    );
  }
}
