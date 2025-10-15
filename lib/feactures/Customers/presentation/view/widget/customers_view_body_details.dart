import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_list.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/empty_customer_list.dart';

class CustomersViewBodyDetails extends StatelessWidget {
  const CustomersViewBodyDetails({super.key, required this.onTap});
  final Function(String) onTap;

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
        child:
            BlocBuilder<CustomersProfileInfoCubit, CustomersProfileInfoState>(
              builder: (context, state) {
                if (state is CustomersProfileInfoLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.kMainColor,
                    ),
                  );
                } else if (state is CustomersProfileInfoSuccess) {
                  if (state.customers.isNotEmpty) {
                    return CustomersList(
                      onTap: onTap,
                      customerEntity: state.customers,
                    );
                  } else {
                    return EmptyCustomerList();
                  }
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
            ),
      ),
    );
  }
}
