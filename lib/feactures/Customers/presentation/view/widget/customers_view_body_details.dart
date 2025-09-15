import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_header.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_table_row.dart';

class CustomersViewBodyDetails extends StatelessWidget {
  const CustomersViewBodyDetails({super.key, required this.onTap});
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomersProfileInfoCubit>(
      context,
    ).fetchCustomersInfo(context);
    return BlocBuilder<CustomersProfileInfoCubit, CustomersProfileInfoState>(
      builder: (context, state) {
        if (state is CustomersProfileInfoLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is CustomersProfileInfoSuccess) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 0.77,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.018,
                  horizontal: MediaQuery.sizeOf(context).width * 0.027,
                ),
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
                        0: FixedColumnWidth(
                          MediaQuery.sizeOf(context).width * 0.25,
                        ),
                        1: FixedColumnWidth(
                          MediaQuery.sizeOf(context).width * 0.23,
                        ),
                        2: FixedColumnWidth(
                          MediaQuery.sizeOf(context).width * 0.13,
                        ),
                      },
                      children: [
                        customersTableHeader(context),
                        ...List.generate(
                          state.customerEntity.length,
                          (index) => customersTableRow(
                            context,
                            customersEntity: state.customerEntity[index],
                            onTap: onTap,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is CustomersProfileInfoFailure) {
          return Center(
            child: Text(
              "Error: ${state.errorMessage}",
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
