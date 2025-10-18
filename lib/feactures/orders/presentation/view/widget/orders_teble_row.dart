import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/entity/active_orders_entity.dart';

TableRow ordersTableRow(
  BuildContext context, {
  required OrderEntity actieOrderEntity,
  Function()? onTap,
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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(actieOrderEntity.product.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 12),
            Flexible(
              child: Text(
                actieOrderEntity.product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
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
          DateFormat('MMM d  HH:mm').format(actieOrderEntity.createdAt),
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
          actieOrderEntity.customerName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

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
          actieOrderEntity.customerAddress,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

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
          actieOrderEntity.quantity.toString(),
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
              '\$${actieOrderEntity.totalAmount}',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(width: 10),
            Flexible(
              child: GestureDetector(
                onTap: onTap,
                child: Text(
                  'see more...',
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
