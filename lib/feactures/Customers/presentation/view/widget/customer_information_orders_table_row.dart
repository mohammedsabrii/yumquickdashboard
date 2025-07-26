import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/payment_state_container.dart';
import 'package:yumquickdashboard/feactures/Customers/model/customer_information_orders_table_model.dart';

TableRow customersInforamtionOrdersTable(
  BuildContext context, {
  required CustomerInformationOrdersTableModel
  customersinformationOrdersTableModel,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          customersinformationOrdersTableModel.order,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          customersinformationOrdersTableModel.date,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: PaymentStateContainer(
            isActive: customersinformationOrdersTableModel.orderState,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          customersinformationOrdersTableModel.price,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
