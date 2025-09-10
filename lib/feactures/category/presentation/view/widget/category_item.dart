import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/category/model/category_model.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, this.onTap, required this.categoryModel});
  final Function()? onTap;
  final CategoryModel categoryModel;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool showCategoryEditView = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width * 0.243,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.categoryModel.imagePath),
                fit: BoxFit.fitWidth,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.094,
            width: MediaQuery.sizeOf(context).width * 0.243,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.0239,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.017),
                  Text(
                    widget.categoryModel.name,
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                  Text(
                    widget.categoryModel.itemCount.toString(),
                    style: AppStayls.styleInterRegular14(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
