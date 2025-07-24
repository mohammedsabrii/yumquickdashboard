import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_view_body.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CustomersViewBody()));
  }
}
