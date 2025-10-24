import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

TableRow customTableRecentTransactionsRow(
  BuildContext context, {
  required OrdersEntity ordersEntity,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    children: [
      Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Text(
            ordersEntity.product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStayls.styleInterRegular12(
              context,
            ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Text(
            ordersEntity.customerName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStayls.styleInterRegular12(
              context,
            ).copyWith(color: AppColor.kDarkRed, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          DateFormat('MMM d  HH:mm').format(ordersEntity.createdAt),
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          '\$${ordersEntity.totalAmount}',
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
