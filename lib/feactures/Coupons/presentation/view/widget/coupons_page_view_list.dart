import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_page_view_header.dart';

class CouponsPageViewList extends StatelessWidget {
  const CouponsPageViewList({
    super.key,
    required this.cruntPageIndex,
    required this.pageController,
  });
  final List<String> couponsData = const [
    'All Coupons',
    'Active Coupons',
    'Expired Coupons',
  ];
  final int cruntPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        couponsData.length,
        (index) => CouponsPageViewHeader(
          onTap: () {
            pageController.jumpToPage(index);
          },
          isActive: index == cruntPageIndex,
          title: couponsData[index],
        ),
      ),
    );
  }
}
