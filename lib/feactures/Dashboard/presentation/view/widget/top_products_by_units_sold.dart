import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row_header.dart';

class TopProductsByUnitsSold extends StatelessWidget {
  const TopProductsByUnitsSold({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.375,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Products by Units Sold',
                  style: AppStayls.styleInterBold16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                Table(
                  children: [
                    topProductsByUnitsSoldtableRowHeader(context),
                    topProductsByUnitsSoldTableRow(
                      context,
                      name: 'Men Grey Hoodie',
                      price: r'$49.90',
                      unitsSold: '204',
                    ),
                    topProductsByUnitsSoldTableRow(
                      context,
                      name: 'Men Grey Hoodie',
                      price: r'$49.90',
                      unitsSold: '204',
                    ),
                    topProductsByUnitsSoldTableRow(
                      context,
                      name: 'Men Grey Hoodie',
                      price: r'$49.90',
                      unitsSold: '204',
                    ),
                    topProductsByUnitsSoldTableRow(
                      context,
                      name: 'Men Grey Hoodie',
                      price: r'$49.90',
                      unitsSold: '204',
                    ),
                    topProductsByUnitsSoldTableRow(
                      context,
                      name: 'Men Grey Hoodie',
                      price: r'$49.90',
                      unitsSold: '204',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
