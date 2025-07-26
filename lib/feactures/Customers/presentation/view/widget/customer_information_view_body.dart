import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/add_tags.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_information_overview.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_orders.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/personal_information_and_notes.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';

class CustomerInformationViewBody extends StatelessWidget {
  const CustomerInformationViewBody({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.018,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAddedHeader(onClose: onClose, title: 'Customer Information'),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    PersonalInformationAndNotes(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0289,
                    ),
                    CustomerOrders(),
                  ],
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Flexible(
                  child: Column(
                    children: [
                      CustomerInformationOverview(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.0289,
                      ),
                      AddTags(),
                    ],
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
