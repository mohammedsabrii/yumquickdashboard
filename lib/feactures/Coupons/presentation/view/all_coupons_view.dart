import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/fliter_search_edit_and_delete_header.dart';
import 'package:yumquickdashboard/core/widget/order_state.dart';
import 'package:yumquickdashboard/feactures/Coupons/model/all_coupons_table_model.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/all_coupons_table_header.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/all_coupons_table_row.dart';

class AllCouponsView extends StatelessWidget {
  const AllCouponsView({super.key});
  final List<AllCouponsTableModel> allCouponsData = const [
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
    AllCouponsTableModel(
      couponName: 'Summer discount 10% off',
      usage: '15 times',
      date: 'May 5, 2020 - May 15, 2020',
      status: Align(
        alignment: Alignment.centerLeft,
        child: OrderStatus(isActive: false),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
          FliterSearchEditAndDeleteHeader(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.0193),
          Table(
            columnWidths: {
              0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.368),
              1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.097),
              2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.097),
              3: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.169),
            },
            children: [
              allCouponsTableHeader(context),
              ...List.generate(
                allCouponsData.length,
                (index) => allCouponsTableRow(
                  context,
                  allCouponsTableModel: allCouponsData[index],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
