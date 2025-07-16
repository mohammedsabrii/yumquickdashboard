import 'package:flutter/material.dart';

import 'package:yumquickdashboard/feactures/home/presentation/view/widget/drawer_page_view.dart';
import 'package:yumquickdashboard/feactures/home/presentation/view/widget/drawer_page_view_list.dart';

class DrawerPageViewWithIndex extends StatefulWidget {
  const DrawerPageViewWithIndex({super.key});

  @override
  State<DrawerPageViewWithIndex> createState() =>
      _DrawerPageViewWithIndexState();
}

class _DrawerPageViewWithIndexState extends State<DrawerPageViewWithIndex> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      pageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerPageViewList(
          cruntPageIndex: pageIndex,
          pageController: pageController,
        ),
        Expanded(child: DrawerPageView(pageController: pageController)),
      ],
    );
  }
}
