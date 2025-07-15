import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/data/drawer_icon_and_title.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_drawer.dart';
import 'package:yumquickdashboard/core/widget/drawer_item.dart';

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

            ...List.generate(8, (index) {
              return DrawerItem(
                onTap: () {
                  pageController.jumpToPage(index);
                },
                drawerData: drawerIconAndTitle[index],
                isActive: index == cruntPageIndex,
              );
            }),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.0222,
              ),
              child: Text(
                'Other Information',
                style: AppStayls.styleInterRegular12(context),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            ...List.generate(2, (index) {
              final realIndex = 8 + index;
              return DrawerItem(
                onTap: () {
                  pageController.jumpToPage(realIndex);
                },
                drawerData: drawerIconAndTitle[realIndex],
                isActive: realIndex == cruntPageIndex,
              );
            }),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.0222,
              ),
              child: Text(
                'Settings',
                style: AppStayls.styleInterRegular12(context),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            ...List.generate(2, (index) {
              final realIndex = 10 + index;
              return DrawerItem(
                onTap: () {
                  pageController.jumpToPage(realIndex);
                },
                drawerData: drawerIconAndTitle[realIndex],
                isActive: realIndex == cruntPageIndex,
              );
            }),
          ],
        ),
      ),
    );
  }
}
