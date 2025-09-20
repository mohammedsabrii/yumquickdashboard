import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';

class CustomerNameCountryAndAddress extends StatelessWidget {
  const CustomerNameCountryAndAddress({super.key, required this.customerId});
  final String customerId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersProfileInfoCubit, CustomersProfileInfoState>(
      builder: (context, state) {
        if (state is CustomersProfileInfoLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is CustomersProfileInfoSuccess) {
          final customer = state.customers.firstWhere(
            (c) => c.id == customerId,
          );
          return Row(
            spacing: 20,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const ShapeDecoration(
                  color: Color(0xFFA1A7C4),
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Text(
                    customer.name.characters.first,
                    textAlign: TextAlign.center,
                    style: AppStayls.styleInterBold32(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name,
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${customer.country}\n${customer.address}',
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          );
        } else if (state is CustomersProfileInfoFailure) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: AppStayls.styleInterRegular14(
                context,
              ).copyWith(color: Colors.red),
            ),
          );
        }
        return const Center(child: Text('No data available'));
      },
    );
  }
}
