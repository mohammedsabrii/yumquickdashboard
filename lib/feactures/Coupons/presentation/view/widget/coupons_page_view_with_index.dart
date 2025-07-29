import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_page_view.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_page_view_list.dart';

class CouponsPageViewWithIndex extends StatefulWidget {
  const CouponsPageViewWithIndex({super.key});

  @override
  State<CouponsPageViewWithIndex> createState() =>
      _CouponsPageViewWithIndexState();
}

class _CouponsPageViewWithIndexState extends State<CouponsPageViewWithIndex> {
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
    return Column(
      children: [
        CouponsPageViewList(
          cruntPageIndex: pageIndex,
          pageController: pageController,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.97,
          child: CouponsPageView(pageController: pageController),
        ),
      ],
    );
  }
}
