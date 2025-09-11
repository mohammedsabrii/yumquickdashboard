import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/action_item.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

class ProductOfCategoryItem extends StatelessWidget {
  const ProductOfCategoryItem({
    super.key,
    required this.product,
    required this.editIcononTap,
    required this.deleteIcononTap,
  });
  final ProductEntity product;
  final Function() editIcononTap;
  final Function() deleteIcononTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.kDotIcon),
            const SizedBox(width: 10),
            Image.network(
              product.image,
              width: 55,
              height: 48,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                product.name,
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ),
            ActionItem(icon: AppAssets.kEditIcon, onTap: editIcononTap),
            SizedBox(width: 15),
            ActionItem(icon: AppAssets.kDeleteicon, onTap: deleteIcononTap),
          ],
        ),
      ),
    );
  }
}
