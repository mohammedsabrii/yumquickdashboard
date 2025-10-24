import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

TableRow customTableRecentTransactionsRowHeader(BuildContext context) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: Colors.grey)),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          'Product Name',
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          'Customer Name',
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          'Date',
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          'Total amount',
          style: AppStayls.styleInterRegular12(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
    ],
  );
}
