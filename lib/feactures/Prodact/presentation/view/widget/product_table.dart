import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/entity/prodact_entity.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_dialog.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/show_dialog_method.dart';

class ProductsTable extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsTable({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Table(
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
    );
  }
}
