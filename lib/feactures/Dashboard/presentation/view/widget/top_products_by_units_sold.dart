import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_bloc_builder.dart';

class TopProductsByUnitsSold extends StatelessWidget {
  const TopProductsByUnitsSold({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.347,
      height: MediaQuery.sizeOf(context).height * 0.47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.035,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: TopProductsByUnitsSoldBlocBuilder(),
      ),
    );
  }
}
