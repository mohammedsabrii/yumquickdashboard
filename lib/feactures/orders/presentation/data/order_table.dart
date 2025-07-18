import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/order_state.dart';
import 'package:yumquickdashboard/core/widget/payment_state_container.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_teble_row_header.dart';

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        ordersTableRowHeader(context),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
        ordersTableRow(
          context,
          order: '#12512B',
          date: 'May 5, 4:20 PM',
          customer: 'Tom Anderson',
          paymentStatus: Align(
            alignment: Alignment.centerLeft,
            child: PaymentStateContainer(isActive: true),
          ),
          orderStatus: Align(
            alignment: Alignment.centerLeft,
            child: OrderStatus(isActive: false),
          ),
          total: r'$49.90',
        ),
      ],
    );
  }
}
