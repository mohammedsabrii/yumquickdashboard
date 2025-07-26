import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/model/statistics_item_model.dart';
import 'package:yumquickdashboard/core/widget/statistics_item.dart';

class ReportsStatistics extends StatelessWidget {
  const ReportsStatistics({super.key});
  final List<StatisticsItemModel> statisticsItems = const [
    StatisticsItemModel(
      quantity: '5.653',
      relaive: '22.45%',
      title: 'Existing Users',
    ),
    StatisticsItemModel(
      quantity: '1.650',
      relaive: '15.34%',
      title: 'New Users',
    ),
    StatisticsItemModel(
      quantity: '9.504',
      relaive: '18.25%',
      title: 'Total Visits',
    ),
    StatisticsItemModel(
      quantity: '5.423',
      relaive: '10.24%',
      title: 'Unique Visits',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.019,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            statisticsItems.length,
            (index) =>
                StatisticsItem(statisticsItemModel: statisticsItems[index]),
          ),
        ),
      ),
    );
  }
}
