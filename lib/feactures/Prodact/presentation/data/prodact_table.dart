import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_teble_row_header.dart';

class ProdactsTable extends StatelessWidget {
  const ProdactsTable({super.key});
  final List<ProdactTableModel> prodactData = const [
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
    ProdactTableModel(
      prodactImage: AppAssets.kImageTest,
      prodactName: 'Men Grey Hoodie',
      prodactCategory: 'Hoodies',
      prodactInventory: '96 in stock',
      prodactColor: 'Black',
      price: r'$49.90',
      rating: '5.0 (32 Votes)',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.254),
        1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
        2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
        3: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
        4: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.111),
      },
      children: [
        prodactsTableRowHeader(context),
        ...List.generate(
          prodactData.length,
          (index) =>
              prodactsTableRow(context, prodactTableModel: prodactData[index]),
        ),
      ],
    );
  }
}
