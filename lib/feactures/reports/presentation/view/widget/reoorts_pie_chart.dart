import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/model/pie_chart_model.dart';

class ReportsPieChart extends StatelessWidget {
  const ReportsPieChart({super.key, required this.pieChartModel});
  final PieChartModel pieChartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.02),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.177,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.027,
            horizontal: MediaQuery.sizeOf(context).width * 0.027,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  pieChartModel.title,
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0386),
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 28,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            color: pieChartModel.percentageColor,
                            value: pieChartModel.highestPercentage,
                            showTitle: false,
                            radius: 8,
                          ),
                          PieChartSectionData(
                            color: Colors.grey,
                            value: pieChartModel.lowestPercentage,
                            showTitle: false,
                            radius: 8,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      pieChartModel.percentage,
                      style: AppStayls.styleInterBold16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: pieChartModel.pieChartItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
