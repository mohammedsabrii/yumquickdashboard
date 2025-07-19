import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_container.dart';
import 'package:yumquickdashboard/feactures/category/presentation/view/widget/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                Text('Categorys', style: AppStayls.styleInterBold24(context)),
                Spacer(),
                CustomContainer(title: 'Add category'),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
            CategoryGridView(),
          ],
        ),
      ),
    );
  }
}

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return const CategoryItem();
      },
      itemCount: 10,
    );
  }
}
