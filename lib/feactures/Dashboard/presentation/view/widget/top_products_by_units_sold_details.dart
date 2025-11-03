import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/entity/top_selling_entity.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row_header.dart';

class TopProductsByUnitsSoldDetails extends StatelessWidget {
  const TopProductsByUnitsSoldDetails({
    super.key,
    required this.topSellingProducts,
  });
  final List<TopSellingEntity> topSellingProducts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            columnWidths: {
              0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.18),
              1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.065),
              2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.072),
            },
            children: [
              topProductsByUnitsSoldtableRowHeader(context),
              ...List.generate(
                5,
                (index) => topProductsByUnitsSoldTableRow(
                  context,
                  ordersEntity: topSellingProducts[index],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
