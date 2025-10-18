import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_more_details_dialog_item.dart';

class OrderMoreDeitlsDialogDetails extends StatelessWidget {
  const OrderMoreDeitlsDialogDetails({
    super.key,
    required this.activeOrderEntity,
  });

  final OrderEntity activeOrderEntity;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: mq.width * 0.138,
              height: mq.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(activeOrderEntity.product.image),
                ),
              ),
            ),
          ),
          OrderMoreDeitlsDialogItem(
            title: 'Product Name',
            info: activeOrderEntity.product.name,
          ),
          OrderMoreDeitlsDialogItem(
            title: 'Customer Name',
            info: activeOrderEntity.customerName,
          ),
          OrderMoreDeitlsDialogItem(
            title: 'Customer Address',
            info: activeOrderEntity.customerAddress,
          ),
          OrderMoreDeitlsDialogItem(
            title: 'order date',
            info: DateFormat(
              'MMM d  HH:mm',
            ).format(activeOrderEntity.createdAt),
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: OrderMoreDeitlsDialogItem(
                  title: 'Quntity',
                  info: activeOrderEntity.quantity.toString(),
                ),
              ),
              Expanded(
                child: OrderMoreDeitlsDialogItem(
                  title: 'Total amount',
                  info: '\$${activeOrderEntity.totalAmount}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
