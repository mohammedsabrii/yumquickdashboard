import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/fliter_search_edit_and_delete_header.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_category_list.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_header.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_row.dart';

class CustomersViewBodyDetails extends StatelessWidget {
  const CustomersViewBodyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.018,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomersCategoryList(),
              SizedBox(height: 30),
              FliterSearchEditAndDeleteHeader(),
              SizedBox(height: 20),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.368),
                  1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
                  2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
                },
                children: [
                  customersTableHeader(context),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                  customersTableRow(
                    context,
                    name: 'Rakesh Mishra',
                    nameFristLetter: 'R',
                    location: 'Sawaynchester',
                    orders: '5',
                    spent: r'$96.14',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
