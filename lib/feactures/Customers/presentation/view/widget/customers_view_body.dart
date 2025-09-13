import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/customer_information_view.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customers_view_body_details.dart';

class CustomersViewBody extends StatefulWidget {
  const CustomersViewBody({super.key});

  @override
  State<CustomersViewBody> createState() => _CustomersViewBodyState();
}

class _CustomersViewBodyState extends State<CustomersViewBody> {
  bool showCustomerInformation = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.018,
              horizontal: MediaQuery.sizeOf(context).width * 0.027,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: MediaQuery.sizeOf(context).height * 0.026,
              children: [
                Text(
                  'Customers',
                  style: AppStayls.styleInterBold24(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
                CustomersViewBodyDetails(
                  onTap: () {
                    setState(() {
                      showCustomerInformation = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (showCustomerInformation)
          Positioned(
            child: CustomerInformationView(
              onClose: () {
                setState(() {
                  showCustomerInformation = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
