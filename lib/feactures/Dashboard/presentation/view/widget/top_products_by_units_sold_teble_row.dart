import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/top_selling_entity.dart';

TableRow topProductsByUnitsSoldTableRow(
  BuildContext context, {
  required TopSellingEntity ordersEntity,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey)),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.056,
              width: MediaQuery.sizeOf(context).width * 0.029,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(ordersEntity.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
      Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.02,
          ),
          child: Text(
            ordersEntity.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStayls.styleInterRegular14(
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
          '\$${ordersEntity.price}',
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
        ),
        child: Text(
          ordersEntity.totalSales.toString(),
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
