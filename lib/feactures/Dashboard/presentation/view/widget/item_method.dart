import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/model/statistics_item_model.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/app_state_entity.dart';

List<StatisticsItemModel> itemMethod(
  BuildContext context, {
  required AppStatsEntity appStatsEntity,
}) {
  return [
    StatisticsItemModel(
      icon: Container(
        width: 28,
        height: 28,
        decoration: ShapeDecoration(
          color: AppColor.kPinkishOrange,
          shape: OvalBorder(),
        ),
        child: Center(child: SvgPicture.asset(AppAssets.kDollarIcon)),
      ),
      relaive: '\$${appStatsEntity.totalRevenue}',
      title: 'Total Revenue',
    ),
    StatisticsItemModel(
      icon: Container(
        width: 28,
        height: 28,
        decoration: ShapeDecoration(
          color: AppColor.kPinkishOrange,
          shape: OvalBorder(),
        ),
        child: Center(child: SvgPicture.asset(AppAssets.kCartIcon)),
      ),
      relaive: appStatsEntity.totalOrders.toString(),
      title: 'Orders',
    ),
    StatisticsItemModel(
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: appStatsEntity.totalVisits.toString(),
      title: 'Unique Visits',
    ),
    StatisticsItemModel(
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: appStatsEntity.newUsersLast14Days.toString(),
      title: 'New Users',
    ),
    StatisticsItemModel(
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: appStatsEntity.totalUsers.toString(),
      title: 'Total Users',
    ),
  ];
}
