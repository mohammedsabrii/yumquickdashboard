import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';

class AddProdactSeoSettings extends StatelessWidget {
  const AddProdactSeoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.243,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Text(
              'SEO Settings',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),

            AddProdactTextFiled(
              helperText: 'Title',
              hintText: 'Title',
              maxLines: 2,
            ),

            AddProdactTextFiled(
              height: 100,
              helperText: 'Description',
              hintText: 'Description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
