import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/item_method.dart';
import 'package:yumquickdashboard/core/widget/statistics_item.dart';

class StatisticsItemList extends StatelessWidget {
  const StatisticsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: List.generate(itemMethod(context).length, (index) {
        return StatisticsItem(statisticsItemModel: itemMethod(context)[index]);
      }),
    );
  }
}
