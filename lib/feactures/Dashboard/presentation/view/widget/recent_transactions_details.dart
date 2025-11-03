import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_table_recent_transactions_row_header_method.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_tebl_row_method.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

class RecentTransactionsDetails extends StatelessWidget {
  const RecentTransactionsDetails({
    super.key,
    required this.transactionsOrders,
  });

  final List<OrdersEntity> transactionsOrders;
  @override
  Widget build(BuildContext context) {
    final count = transactionsOrders.length.clamp(0, 5);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Transactions',
            style: AppStayls.styleInterBold16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Table(
            children: [
              customTableRecentTransactionsRowHeader(context),

              ...List.generate(
                count,
                (index) => customTableRecentTransactionsRow(
                  context,
                  ordersEntity: transactionsOrders[index],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
