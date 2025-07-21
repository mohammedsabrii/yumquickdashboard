import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_container.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/add_prodact_view.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_list.dart';

class ProdactsView extends StatefulWidget {
  const ProdactsView({super.key});

  @override
  State<ProdactsView> createState() => _ProdactsViewState();
}

class _ProdactsViewState extends State<ProdactsView> {
  bool showAddProduct = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.027,
              horizontal: MediaQuery.sizeOf(context).width * 0.027,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Products',
                      style: AppStayls.styleInterBold24(context),
                    ),
                    Spacer(),
                    CustomContainer(
                      title: 'Add Product',
                      onTap: () {
                        setState(() {
                          showAddProduct = true;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
                ProdactList(),
              ],
            ),
          ),
        ),
        if (showAddProduct)
          Positioned.fill(
            child: AddProdactView(
              onClose: () {
                setState(() {
                  showAddProduct = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
