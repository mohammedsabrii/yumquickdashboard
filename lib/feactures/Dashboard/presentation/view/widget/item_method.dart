import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/statistics_item_model.dart';

List<StatisticsItemModel> itemMethod(BuildContext context) {
  return [
    StatisticsItemModel(
      quantity: '22.45',
      icon: Container(
        width: 28,
        height: 28,
        decoration: ShapeDecoration(
          color: AppColor.kPinkishOrange,
          shape: OvalBorder(),
        ),
        child: Center(child: SvgPicture.asset(AppAssets.kDollarIcon)),
      ),
      relaive: '10.54',
      title: 'Total Revenue',
    ),
    StatisticsItemModel(
      quantity: '15.34',
      icon: Container(
        width: 28,
        height: 28,
        decoration: ShapeDecoration(
          color: AppColor.kPinkishOrange,
          shape: OvalBorder(),
        ),
        child: Center(child: SvgPicture.asset(AppAssets.kCartIcon)),
      ),
      relaive: '1,056',
      title: 'Orders',
    ),
    StatisticsItemModel(
      quantity: '5.420',
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: '10.27',
      title: 'Unique Visits',
    ),
    StatisticsItemModel(
      quantity: '15.34',
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: '1.650',
      title: 'New Users',
    ),
    StatisticsItemModel(
      quantity: '22.45',
      icon: SvgPicture.asset(AppAssets.kChartIcon),
      relaive: '9.653',
      title: 'Existing Users',
    ),
  ];
}
