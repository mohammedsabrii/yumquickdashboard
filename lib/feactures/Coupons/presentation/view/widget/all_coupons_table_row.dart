import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Coupons/model/all_coupons_table_model.dart';

TableRow allCouponsTableRow(
  BuildContext context, {
  required AllCouponsTableModel allCouponsTableModel,
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
              side: BorderSide(color: AppColor.kDarkRed),
            ),

            SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                color: AppColor.kMainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Center(child: SvgPicture.asset(AppAssets.kProdactIcon)),
            ),
            SizedBox(width: 12),
            Text(
              allCouponsTableModel.couponName,
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.03,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          allCouponsTableModel.usage,
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
        child: allCouponsTableModel.status,
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.03,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          allCouponsTableModel.date,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed, fontSize: 13),
        ),
      ),
    ],
  );
}
