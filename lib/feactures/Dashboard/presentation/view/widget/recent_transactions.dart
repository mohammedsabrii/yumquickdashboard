import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_table_recent_transactions_row_header_method.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/custom_tebl_row_method.dart';
import 'package:yumquickdashboard/core/widget/payment_state_container.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.375,
      height: MediaQuery.sizeOf(context).height * 0.47,
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
                  customTableRecentTransactionsRowHeader(context),
                  customTableRecentTransactionsRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: Align(
                      alignment: Alignment.centerLeft,
                      child: PaymentStateContainer(isActive: true),
                    ),
                  ),

                  customTableRecentTransactionsRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: Align(
                      alignment: Alignment.centerLeft,
                      child: PaymentStateContainer(isActive: false),
                    ),
                  ),

                  customTableRecentTransactionsRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: Align(
                      alignment: Alignment.centerLeft,
                      child: PaymentStateContainer(isActive: true),
                    ),
                  ),

                  customTableRecentTransactionsRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: Align(
                      alignment: Alignment.centerLeft,
                      child: PaymentStateContainer(isActive: false),
                    ),
                  ),

                  customTableRecentTransactionsRow(
                    context,
                    name: 'Jagarnath S.',
                    date: '24.05.2023',
                    amount: r'$124.97',
                    status: Align(
                      alignment: Alignment.centerLeft,
                      child: PaymentStateContainer(isActive: true),
                    ),
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
