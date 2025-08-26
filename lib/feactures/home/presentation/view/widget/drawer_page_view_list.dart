import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/home/data/drawer_icon_and_title.dart';
import 'package:yumquickdashboard/feactures/home/presentation/view/widget/custom_drawer.dart';
import 'package:yumquickdashboard/feactures/home/presentation/view/widget/drawer_item.dart';

class DrawerPageViewList extends StatelessWidget {
  const DrawerPageViewList({
    super.key,
    required this.pageController,
    required this.cruntPageIndex,
  });

  final PageController pageController;
  final int cruntPageIndex;
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

            ...List.generate(drawerIconAndTitle.length, (index) {
              return DrawerItem(
                onTap: () {
                  pageController.jumpToPage(index);
                },
                drawerData: drawerIconAndTitle[index],
                isActive: index == cruntPageIndex,
              );
            }),
          ],
        ),
      ),
    );
  }
}
