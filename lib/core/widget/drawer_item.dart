import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquickdashboard/core/manger/drawer_data.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.drawerData,
    this.onTap,
    required this.isActive,
  });
  final DrawerData drawerData;
  final bool isActive;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * 0.01111,
            bottom: MediaQuery.sizeOf(context).height * 0.0125,
          ),
          child: Container(
            height: 44,
            width: MediaQuery.sizeOf(context).width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01111),
                SvgPicture.asset(drawerData.icon, color: AppColor.kDarkRed),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.0111),
                Text(
                  drawerData.title,
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.01111),
              ],
            ),
          ),
        )
        : GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width * 0.0222,
              bottom: MediaQuery.sizeOf(context).height * 0.03,
            ),
            child: Row(
              children: [
                SvgPicture.asset(drawerData.icon),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.0111),
                Text(
                  drawerData.title,
                  style: AppStayls.styleInterRegular14(context),
                ),
              ],
            ),
          ),
        );
  }
}
