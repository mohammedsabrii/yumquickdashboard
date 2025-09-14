import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';

TableRow customersTableRow(
  BuildContext context, {
  required CustomerEntity customersEntity,
  required Function(String) onTap,
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
        child: GestureDetector(
          onTap: () => onTap(customersEntity.id),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: ShapeDecoration(
                  color: const Color(0xFFA1A7C4),
                  shape: OvalBorder(),
                ),
                alignment: Alignment.center,
                child: Text(
                  customersEntity.name.characters.first,
                  style: AppStayls.styleInterBold24(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customersEntity.name,
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02,
          bottom: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Text(
          customersEntity.email,
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
          customersEntity.phone,
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
          customersEntity.country,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ),
    ],
  );
}
