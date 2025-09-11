import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/add_prodact_view.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/product_of_category_information.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/show_category_edit_view_header.dart';

class ShowCategoryEditViewBody extends StatefulWidget {
  const ShowCategoryEditViewBody({
    super.key,
    required this.onClose,
    required this.category,
  });
  final VoidCallback onClose;
  final CategoryModel category;

  @override
  State<ShowCategoryEditViewBody> createState() =>
      _ShowCategoryEditViewBodyState();
}

class _ShowCategoryEditViewBodyState extends State<ShowCategoryEditViewBody> {
  bool showAddProdactView = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.018,
            horizontal: MediaQuery.sizeOf(context).width * 0.027,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowCategoryEditViewHeader(onClose: widget.onClose),

                SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
                ProductOfCategoryInformation(
                  pushToAddProdactView: () {
                    setState(() {
                      showAddProdactView = true;
                    });
                  },
                  category: widget.category,
                ),
              ],
            ),
          ),
        ),
        if (showAddProdactView)
          Positioned(
            child: AddProdactView(
              onClose: () {
                setState(() {
                  showAddProdactView = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
