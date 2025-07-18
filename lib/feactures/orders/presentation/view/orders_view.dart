import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/orders_list.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Orders', style: AppStayls.styleInterBold24(context)),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
            OrdersList(),
          ],
        ),
      ),
    );
  }
}
