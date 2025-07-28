import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/model/top_customers_table_row_model.dart';

TableRow topCustomersTableRow(
  BuildContext context, {
  required TopCustomersTableRowModel topCustomersTableRowModel,
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
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: ShapeDecoration(
                color: AppColor.kMainColor,
                shape: OvalBorder(),
              ),
              child: Center(
                child: Text(
                  topCustomersTableRowModel.nameFristLetter,
                  textAlign: TextAlign.center,
                  style: AppStayls.styleInterBold18(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              topCustomersTableRowModel.name,
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          topCustomersTableRowModel.orders,
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
          topCustomersTableRowModel.spent,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
