import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/model/customer_information_orders_table_model.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_information_orders_table_row.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_information_orders_table_row_header.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});
  final List<CustomerInformationOrdersTableModel> customersData = const [
    CustomerInformationOrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      price: r'$49.90',
      orderState: true,
    ),
    CustomerInformationOrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      price: r'$49.90',
      orderState: false,
    ),
    CustomerInformationOrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      price: r'$49.90',
      orderState: true,
    ),
    CustomerInformationOrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      price: r'$49.90',
      orderState: true,
    ),
    CustomerInformationOrdersTableModel(
      order: '#12512B',
      date: 'May 5, 4:20 PM',
      price: r'$49.90',
      orderState: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: MediaQuery.sizeOf(context).height * 0.027,
          children: [
            Text(
              'Customer Orders',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),

            Table(
              children: [
                customersInforamtionOrdersTableHeader(context),
                ...List.generate(
                  customersData.length,
                  (index) => customersInforamtionOrdersTable(
                    context,
                    customersinformationOrdersTableModel: customersData[index],
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
