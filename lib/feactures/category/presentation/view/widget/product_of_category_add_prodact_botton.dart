import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';

class ProductOfCategoryAddProdactBotton extends StatelessWidget {
  const ProductOfCategoryAddProdactBotton({
    super.key,
    this.width,
    required this.pushToAddProdactView,
  });
  final double? width;
  final Function() pushToAddProdactView;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pushToAddProdactView,
      child: Container(
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
      ),
    );
  }
}
