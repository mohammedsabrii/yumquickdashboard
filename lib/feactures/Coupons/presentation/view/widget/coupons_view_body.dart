import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_page_view_with_index.dart';

class CouponsViewBody extends StatelessWidget {
  const CouponsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.028,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coupons',
              style: AppStayls.styleInterBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.77,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.027,
                  horizontal: MediaQuery.sizeOf(context).width * 0.019,
                ),
                child: Column(children: [CouponsPageViewWithIndex()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
