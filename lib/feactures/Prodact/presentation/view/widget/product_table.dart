import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_dialog.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/show_dialog_method.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Products',
          style: AppStayls.styleInterBold20(
            context,
          ).copyWith(color: AppColor.kDarkRed),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),
        Table(
          children: [
            prodactsTableRowHeader(context),
            ...List.generate(
              products.length,
              (index) => prodactsTableRow(
                context,
                prodactEntity: products[index],
                deleteIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) =>
                            ShowDeleteProductDialog(id: products[index].id),
                  );
                },
                editIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) =>
                            EditProductDialog(productEntity: products[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
