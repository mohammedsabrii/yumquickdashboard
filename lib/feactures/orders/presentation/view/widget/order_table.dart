import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_more_details_dialog.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row_header.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({super.key, required this.activeOrderEntity});
  final List<ActiveOrderEntity> activeOrderEntity;
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.15),
        1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.12),
        2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.12),
        3: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.1),
        4: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.1),
        5: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.12),
      },
      children: [
        ordersTableRowHeader(context),
        ...List.generate(
          activeOrderEntity.length,
          (index) => ordersTableRow(
            context,
            actieOrderEntity: activeOrderEntity[index],
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => OrderMoreDetailsDialog(
                      id: activeOrderEntity[index].id!,
                      activeOrderEntity: activeOrderEntity[index],
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}
