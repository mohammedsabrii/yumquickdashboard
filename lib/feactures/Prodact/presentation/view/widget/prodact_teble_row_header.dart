import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

TableRow prodactsTableRowHeader(BuildContext context) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2, color: Colors.grey)),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Row(
          children: [
            Text(
              'Image',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.grey),
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
          'Name',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          'Category',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          'Price',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          'Edit Or Delete',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
      ),
    ],
  );
}
