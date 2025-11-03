import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/last_7_days_sales_bloc_builder.dart';

class Last7DaysSales extends StatelessWidget {
  const Last7DaysSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.153,
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
        child: Last7DaysSalesBlocBuilder(),
      ),
    );
  }
}
