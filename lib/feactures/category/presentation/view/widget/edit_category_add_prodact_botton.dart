import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class EditCategoryAddProdactBotton extends StatelessWidget {
  const EditCategoryAddProdactBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+',
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: AppColor.kMainColor, fontSize: 24),
          ),
          SizedBox(width: 5),
          Text(
            'Add Prodact',
            style: AppStayls.styleInterRegular16(
              context,
            ).copyWith(color: AppColor.kMainColor),
          ),
        ],
      ),
    );
  }
}
