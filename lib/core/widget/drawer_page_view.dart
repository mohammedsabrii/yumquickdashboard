import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/drawer_items_data.dart';

class DrawerPageView extends StatefulWidget {
  const DrawerPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<DrawerPageView> createState() => _DrawerPageViewState();
}

class _DrawerPageViewState extends State<DrawerPageView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      controller: widget.pageController,
      itemCount: drawerItamsData.length,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => drawerItamsData[index],
    );
  }
}
