import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/order_state.dart';
import 'package:yumquickdashboard/core/widget/payment_state_container.dart';
import 'package:yumquickdashboard/feactures/orders/model/order_table_model.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row_header.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});
  final List<OrdersTableModel> ordersData = const [
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
    OrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      customer: 'Tom Anderson',
      paymentState: Align(
        alignment: Alignment.centerLeft,
        child: PaymentStateContainer(isActive: true),
      ),
      orderState: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
      total: r'$49.90',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        ordersTableRowHeader(context),
        ...List.generate(
          ordersData.length,
          (index) =>
              ordersTableRow(context, ordersTableModel: ordersData[index]),
        ),
      ],
    );
  }
}
