import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

TableRow prodactsTableRow(
  BuildContext context, {
  required ProdactTableModel prodactTableModel,
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
            Checkbox(
              value: false,
              onChanged: (value) {},
              side: BorderSide(color: Colors.grey),
            ),

            Image.asset(prodactTableModel.prodactImage, width: 59, height: 48),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prodactTableModel.prodactName,
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Text(
                  prodactTableModel.prodactCategory,
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
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
          prodactTableModel.prodactInventory,
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
          prodactTableModel.prodactColor,
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
          prodactTableModel.price,
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
          prodactTableModel.rating,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
