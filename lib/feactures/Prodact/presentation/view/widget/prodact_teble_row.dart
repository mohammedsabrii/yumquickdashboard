import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/action_item.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

TableRow prodactsTableRow(
  BuildContext context, {
  required ProductEntity prodactTableModel,
  bool isSelected = false,
  required dynamic Function() editIcononTap,
  required dynamic Function() deleteIcononTap,
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
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.network(prodactTableModel.image, width: 59, height: 48),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.03,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          prodactTableModel.name,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.03,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          prodactTableModel.category,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.03,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          prodactTableModel.price.toString(),
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
        child: Row(
          children: [
            Text(
              prodactTableModel.priceAfterDiscount.toString(),
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            Spacer(),
            ActionItem(icon: AppAssets.kEditIcon, onTap: editIcononTap),
            SizedBox(width: 15),
            ActionItem(icon: AppAssets.kDeleteicon, onTap: deleteIcononTap),
          ],
        ),
      ),
    ],
  );
}
