import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/action_item.dart';
import 'package:yumquickdashboard/feactures/Coupons/entity/offers_entity.dart';

TableRow allOffersTableRow(
  BuildContext context, {
  required OffersEntity offersEntity,
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
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                color: AppColor.kMainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Center(
                child: Image.network(
                  offersEntity.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              offersEntity.offerName,
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
          offersEntity.productName,
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
          offersEntity.price.toString(),
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
          offersEntity.priceAfterDiscount.toString(),
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
        child: Row(
          children: [
            Text(
              '${((offersEntity.priceAfterDiscount / offersEntity.price) * 100).toInt()} %',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed, fontSize: 13),
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
