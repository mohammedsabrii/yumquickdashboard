import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';

class CustomAddedHeader extends StatelessWidget {
  const CustomAddedHeader({
    super.key,
    required this.onClose,
    required this.title,
    this.onSave,
    this.onCancel,
  });

  final VoidCallback onClose;
  final String title;
  final Function()? onSave, onCancel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onClose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 4,
            children: [
              SvgPicture.asset(AppAssets.kBackicon),
              Text(
                'Back',
                style: AppStayls.styleInterRegular14(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              title,
              style: AppStayls.styleInterBold24(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onCancel,
              child: CustomButtom(
                title: 'Cancel',
                backgroundColor: AppColor.kPinkishOrange,
                textColor: AppColor.kMainColor,
              ),
            ),
            SizedBox(width: 10),
            CustomButtom(onTap: onSave, title: 'Save'),
          ],
        ),
      ],
    );
  }
}
