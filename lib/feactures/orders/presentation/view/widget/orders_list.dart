import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/data/order_table.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/action_item.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/custom_drop_button.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/custom_search_text_fild.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.876,
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomDropButton(),
                  SizedBox(width: 12),
                  CustomSearchTextFild(),
                  Spacer(),
                  ActionItem(icon: AppAssets.kEditIcon),
                  SizedBox(width: 12),
                  ActionItem(icon: AppAssets.kDeleteicon),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),
              OrdersTable(),
            ],
          ),
        ),
      ),
    );
  }
}
