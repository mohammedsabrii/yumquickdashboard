import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_more_details_dialog_actions.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_more_details_dialog_details.dart';

class OrderMoreDetailsDialog extends StatelessWidget {
  const OrderMoreDetailsDialog({
    super.key,
    required this.id,
    required this.activeOrderEntity,
  });
  final String id;
  final OrdersEntity activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return AlertDialog(
      backgroundColor: AppColor.kBackGroundColor,
      title: Text(
        'Order Info',
        style: AppStayls.styleInterBold20(
          context,
        ).copyWith(color: AppColor.kDarkRed),
      ),
      content: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: mq.width * 0.5),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.02),
            child: OrderMoreDeitlsDialogDetails(
              activeOrderEntity: activeOrderEntity,
            ),
          ),
        ),
      ),
      actions: [
        OrderMoreDeitlsDialogActions(activeOrderEntity: activeOrderEntity),
      ],
    );
  }
}
