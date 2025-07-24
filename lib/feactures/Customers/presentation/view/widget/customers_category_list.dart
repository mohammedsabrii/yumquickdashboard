import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_category.dart';

class CustomersCategoryList extends StatelessWidget {
  const CustomersCategoryList({super.key});
  final List<String> categories = const [
    'All Customers',
    'New Customers',
    'From Europe',
    'Returning Customers',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        categories.length,
        (index) => CustomersCategory(title: categories[index]),
      ),
    );
  }
}
