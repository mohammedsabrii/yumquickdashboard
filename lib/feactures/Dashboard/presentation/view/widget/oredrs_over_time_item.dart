import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/orders_day_item.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/orders_over_time_chart.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/total_item.dart';

class OredrsOverTimeItem extends StatelessWidget {
  const OredrsOverTimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.57,
      height: MediaQuery.sizeOf(context).height * 0.586,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.035,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Orders Over Time',
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                Spacer(),
                Text(
                  'Last 12 Hours',
                  textAlign: TextAlign.right,
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
                SizedBox(width: 5),
                RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    AppAssets.kUpIcon,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Row(
              children: [
                TotalItem(title: 'Orders on May 22', totalOrders: '645'),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.027),
                TotalItem(title: 'Orders on May 21', totalOrders: '472'),
                Spacer(),
                OrderDayItem(color: AppColor.kPinkishOrange, day: 'May 21'),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.014),
                OrderDayItem(color: AppColor.kMainColor, day: 'May 22'),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.035),
            Flexible(child: OrdersOverTimeChart()),
          ],
        ),
      ),
    );
  }
}
