import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/model/statistics_item_model.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.statisticsItemModel});
  final StatisticsItemModel statisticsItemModel;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // width: MediaQuery.sizeOf(context).width * 0.14,
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
                    statisticsItemModel.relaive,
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  statisticsItemModel.title,
                  style: AppStayls.styleInerRegular10(context),
                ),
              ],
            ),

            Spacer(),
            Flexible(
              child:
                  statisticsItemModel.icon ??
                  VerticalDivider(color: Colors.grey, thickness: 1),
            ),
          ],
        ),
      ),
    );
  }
}
