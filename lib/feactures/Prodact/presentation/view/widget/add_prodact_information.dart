import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';

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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // make sure alignment is left
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Transform.scale(
                    scale: 0.7,
                    child: SwitchListTile(
                      activeTrackColor: AppColor.kMainColor,
                      inactiveTrackColor: AppColor.kPinkishOrange,
                      trackOutlineColor: WidgetStateProperty.all<Color>(
                        Colors.transparent,
                      ),
                      activeColor: AppColor.kCultured,
                      inactiveThumbColor: AppColor.kCultured,
                      value: false,
                      onChanged: (value) {},
                      contentPadding: EdgeInsets.zero, // remove default padding
                      // remove title from SwitchListTile, we’ll put text separately
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Add tax for this product',
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
