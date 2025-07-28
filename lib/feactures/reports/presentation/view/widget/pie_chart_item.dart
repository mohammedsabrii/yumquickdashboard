import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/model/pie_chart_item_model.dart';

class PieChartItem extends StatelessWidget {
  const PieChartItem({super.key, required this.pieChartItemModel});
  final PieChartItemModel pieChartItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pieChartItemModel.label,
          style: AppStayls.styleInterRegular14(
            context,
          ).copyWith(color: Colors.grey),
        ),
        Spacer(),
        Text(
          pieChartItemModel.value,
          style: AppStayls.styleInterBold14(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
      ],
    );
  }
}
