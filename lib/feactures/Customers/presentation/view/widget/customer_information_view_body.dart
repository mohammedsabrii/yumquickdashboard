import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_name_country_total_orders_and_joining_date.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';

class CustomerInformationViewBody extends StatelessWidget {
  const CustomerInformationViewBody({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.018,
        horizontal: MediaQuery.sizeOf(context).width * 0.027,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAddedHeader(onClose: onClose, title: 'Customer Information'),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.0289),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.027,
                horizontal: MediaQuery.sizeOf(context).width * 0.0194,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomerNameCountryTotalOrdersAndJoiningDate(),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.0386),
                  Divider(color: Colors.grey),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
                  Text(
                    'Customer Notes',
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.023),
                  CustomTextFiled(
                    helperText: 'Notes',
                    hintText: 'Add notes about customer',
                    height: 100,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
