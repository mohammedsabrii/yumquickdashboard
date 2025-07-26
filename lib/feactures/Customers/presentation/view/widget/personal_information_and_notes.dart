import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/view/widget/customer_name_country_total_orders_and_joining_date.dart';

class PersonalInformationAndNotes extends StatelessWidget {
  const PersonalInformationAndNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
