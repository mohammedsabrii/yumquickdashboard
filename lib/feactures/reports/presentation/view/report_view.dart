import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/model/pie_chart_item_model.dart';
import 'package:yumquickdashboard/feactures/reports/model/pie_chart_model.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/customer_growth.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/pie_chart_item.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/reoorts_pie_chart.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/reports_average_order_value.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/reports_statistics.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/reports_top_customers.dart';

class ReportView extends StatelessWidget {
  ReportView({super.key});

  final List<PieChartModel> pieCharts = [
    PieChartModel(
      title: 'Sales Goal',
      highestPercentage: 75,
      lowestPercentage: 25,
      percentageColor: AppColor.kYellowBase,
      percentage: '75%',
      pieChartItem: Column(
        children: List.generate(
          pieChartSalesGoal.length,
          (index) => PieChartItem(pieChartItemModel: pieChartSalesGoal[index]),
        ),
      ),
    ),
    PieChartModel(
      title: 'Conversion Rate',
      highestPercentage: 25,
      percentageColor: AppColor.kMainColor,
      lowestPercentage: 75,
      percentage: '75%',
      pieChartItem: Column(
        children: List.generate(
          pieChartConversionRate.length,
          (index) =>
              PieChartItem(pieChartItemModel: pieChartConversionRate[index]),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reports', style: AppStayls.styleInterBold24(context)),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
            CustomerGrowth(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
            ReportsStatistics(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
            Row(
              children: [
                ...List.generate(
                  pieCharts.length,
                  (index) => ReportsPieChart(pieChartModel: pieCharts[index]),
                ),
                Flexible(child: ReportsAverageOrderValue()),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
            ReportsTopCustomers(),
          ],
        ),
      ),
    );
  }
}

final List<PieChartItemModel> pieChartSalesGoal = const [
  PieChartItemModel(label: 'Sold for:', value: r'$15.000'),
  PieChartItemModel(label: 'Month goal:', value: r'$20.000'),
  PieChartItemModel(label: 'Left:', value: r'$5.000'),
];
final List<PieChartItemModel> pieChartConversionRate = const [
  PieChartItemModel(label: 'Cart:', value: '35%'),
  PieChartItemModel(label: 'Checkout:', value: '29%'),
  PieChartItemModel(label: 'Purchase:', value: '25%'),
];
