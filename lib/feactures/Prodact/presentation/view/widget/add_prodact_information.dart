import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_switch.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/size_selector_row.dart';

class AddProdactInformation extends StatelessWidget {
  const AddProdactInformation({super.key});

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
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            AddProdactTextFiled(
              helperText: 'Product Name',
              hintText: 'Summer T-Shirt',
            ),
            SizedBox(height: 24),
            AddProdactTextFiled(
              height: 100,
              maxLines: 10,
              helperText: 'Product description',
              hintText: 'Product description',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Text(
              'Images',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 24),
            PickImage(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Text(
              'Price',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                AddProdactTextFiled(
                  helperText: 'Prodact Price',
                  hintText: 'Enter price',
                  width: MediaQuery.sizeOf(context).width * 0.22,
                ),
                SizedBox(width: 20),
                AddProdactTextFiled(
                  helperText: 'Discount Price',
                  hintText: 'Price at Discount',
                  width: MediaQuery.sizeOf(context).width * 0.22,
                ),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.012),
            CustomSwitch(title: 'Add tax for this product'),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.024),
            Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.0169),
            Text(
              'Different Options',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.012),
            CustomSwitch(title: 'This product has multiple options'),
            SizeSelectorRow(),
          ],
        ),
      ),
    );
  }
}
