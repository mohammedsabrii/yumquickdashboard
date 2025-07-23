import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/pick_image.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, this.onTap});
  final Function()? onTap;
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
                image: AssetImage(AppAssets.kCategoryImageTest),
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
                    'Men Clothes',
                    style: AppStayls.styleInterBold16(
                      context,
                    ).copyWith(color: AppColor.kDarkRed),
                  ),
                  Text(
                    '24 items',
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

class ShowAddCategoryView extends StatelessWidget {
  const ShowAddCategoryView({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: ShowAddCategoryViewBody(onClose: onClose)),
    );
  }
}

class ShowAddCategoryViewBody extends StatelessWidget {
  const ShowAddCategoryViewBody({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.018,
        horizontal: MediaQuery.sizeOf(context).width * 0.027,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAddedHeader(onClose: onClose, title: 'Add Category'),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
            AddCategooryInformation(),
          ],
        ),
      ),
    );
  }
}

class AddCategooryInformation extends StatelessWidget {
  const AddCategooryInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.77,
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
              helperText: 'Category Name',
              hintText: 'Category Name',
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
          ],
        ),
      ),
    );
  }
}
