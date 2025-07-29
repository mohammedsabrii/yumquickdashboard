import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Coupons/data/coupons_page_view_data.dart';

class CouponsPageView extends StatefulWidget {
  const CouponsPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<CouponsPageView> createState() => _CouponsPageViewState();
}

class _CouponsPageViewState extends State<CouponsPageView> {
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
      itemCount: couponsPageViewData.length,
      itemBuilder: (context, index) => couponsPageViewData[index],
    );
  }
}
