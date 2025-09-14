import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_information_view_body.dart';

class CustomerInformationView extends StatelessWidget {
  const CustomerInformationView({
    super.key,
    required this.onClose,
    required this.customerId,
  });
  final VoidCallback onClose;
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomerInformationViewBody(
          onClose: onClose,
          customerId: customerId,
        ),
      ),
    );
  }
}
