import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/entity/customer_entity.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_header.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_row.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({
    super.key,
    required this.onTap,
    required this.customerEntity,
  });

  final Function(String p1) onTap;
  final List<CustomerEntity> customerEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Customers',
            style: AppStayls.styleInterBold24(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          SizedBox(height: 20),
          Table(
            columnWidths: {
              0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.25),
              1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.23),
              2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.13),
            },
            children: [
              customersTableHeader(context),
              ...List.generate(
                customerEntity.length,
                (index) => customersTableRow(
                  context,
                  customersEntity: customerEntity[index],
                  onTap: onTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
