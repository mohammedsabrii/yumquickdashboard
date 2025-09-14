import 'package:flutter/material.dart';

import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_name_country_total_orders_and_joining_date.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key, required this.customerId});
  final String customerId;
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
          children: [
            CustomerNameCountryTotalOrdersAndJoiningDate(
              customerId: customerId,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0386),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
