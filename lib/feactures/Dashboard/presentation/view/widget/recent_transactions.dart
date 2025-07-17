import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_tebl_row_method.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/state_container.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.47,
      height: MediaQuery.sizeOf(context).height * 0.395,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.035,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Transactions',
                style: AppStayls.styleInterBold16(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              Table(
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Name',
                        style: AppStayls.styleInterRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                      Text(
                        'Date',
                        style: AppStayls.styleInterRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                      Text(
                        'Amount',
                        style: AppStayls.styleInterRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                      Text(
                        'Status',
                        style: AppStayls.styleInterRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  customTableRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: StateContainer(isActive: true),
                  ),

                  customTableRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: StateContainer(isActive: false),
                  ),

                  customTableRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: StateContainer(isActive: true),
                  ),

                  customTableRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: StateContainer(isActive: false),
                  ),

                  customTableRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: StateContainer(isActive: true),
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
