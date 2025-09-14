import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';

class CustomerInformationOverview extends StatelessWidget {
  const CustomerInformationOverview({super.key, required this.customerId});
  final String customerId;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: BlocBuilder<
          CustomersProfileInfoCubit,
          CustomersProfileInfoState
        >(
          builder: (context, state) {
            if (state is CustomersProfileInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CustomersProfileInfoSuccess &&
                state.customerEntity.isNotEmpty) {
              final customer = state.customerEntity.firstWhere(
                (c) => c.id == customerId,
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Overview',
                        style: AppStayls.styleInterBold16(
                          context,
                        ).copyWith(color: AppColor.kDarkRed),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
                  Text(
                    'Address',
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    customer.address,
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
                  Text(
                    'Email Address',
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  Text(
                    customer.email,
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
                  Text(
                    'Phone',
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  Text(
                    customer.phone,
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
                  const Divider(color: Colors.grey),
                ],
              );
            } else if (state is CustomersProfileInfoFailure) {
              return Center(
                child: Text(
                  'error: ${state.errorMassage}',
                  style: AppStayls.styleInterRegular14(
                    context,
                  ).copyWith(color: Colors.red),
                ),
              );
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
