import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/statistics_item_model.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.statisticsItemModel});
  final StatisticsItemModel statisticsItemModel;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.14,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    '\$${statisticsItemModel.relaive}',
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                ),
                Text(
                  statisticsItemModel.title,
                  style: AppStayls.styleInerRegular10(context),
                ),
                Row(
                  children: [
                    Text(
                      '${statisticsItemModel.quantity}%',
                      style: AppStayls.styleInerRegular10(
                        context,
                      ).copyWith(color: AppColor.kMainColor),
                    ),
                    SvgPicture.asset(AppAssets.kUpIcon),
                  ],
                ),
              ],
            ),
            Spacer(),
            statisticsItemModel.icon,
            // Container(
            //   width: 28,
            //   height: 28,
            //   decoration: ShapeDecoration(
            //     color: AppColor.kPinkishOrange,
            //     shape: OvalBorder(),
            //   ),
            //   child: Center(
            //     child: Text(
            //       r'$',
            //       style: AppStayls.styleInterRegular12(
            //         context,
            //       ).copyWith(color: AppColor.kDarkRed),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
