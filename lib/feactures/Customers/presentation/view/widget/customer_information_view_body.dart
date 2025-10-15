import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_information_overview.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_orders.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_information_view_header.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/personal_information.dart';

class CustomerInformationViewBody extends StatefulWidget {
  const CustomerInformationViewBody({
    super.key,
    required this.onClose,
    required this.customerId,
  });
  final VoidCallback onClose;
  final String customerId;

  @override
  State<CustomerInformationViewBody> createState() =>
      _CustomerInformationViewBodyState();
}

class _CustomerInformationViewBodyState
    extends State<CustomerInformationViewBody> {
  @override
  void initState() {
    BlocProvider.of<CustomersProfileInfoCubit>(
      context,
    ).fetchCustomerById(context, widget.customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.018,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomersInformationViewHeader(onClose: widget.onClose),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    PersonalInformation(customerId: widget.customerId),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.0289,
                    ),
                    CustomerOrders(),
                  ],
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Flexible(
                  child: CustomerInformationOverview(
                    customerId: widget.customerId,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
