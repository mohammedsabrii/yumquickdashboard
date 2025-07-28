import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/reports/model/top_customers_table_row_model.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/top_customers_table_header.dart';
import 'package:yumquickdashboard/feactures/reports/presentation/view/widget/top_customers_table_row.dart';

class ReportsTopCustomers extends StatelessWidget {
  const ReportsTopCustomers({super.key});
  final List<TopCustomersTableRowModel> topCustomersData = const [
    TopCustomersTableRowModel(
      name: 'Lee Henry',
      nameFristLetter: 'L',
      orders: '52',
      spent: r'$969.37',
    ),
    TopCustomersTableRowModel(
      name: 'Lee Henry',
      nameFristLetter: 'L',
      orders: '52',
      spent: r'$969.37',
    ),
    TopCustomersTableRowModel(
      name: 'Lee Henry',
      nameFristLetter: 'L',
      orders: '52',
      spent: r'$969.37',
    ),
    TopCustomersTableRowModel(
      name: 'Lee Henry',
      nameFristLetter: 'L',
      orders: '52',
      spent: r'$969.37',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.375,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.019,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Customers',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 20),
            Table(
              columnWidths: {
                0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.191),
                1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.0694),
                2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.0694),
              },
              children: [
                topCustomersTableHeader(context),
                ...List.generate(
                  topCustomersData.length,
                  (index) => topCustomersTableRow(
                    context,
                    topCustomersTableRowModel: topCustomersData[index],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
