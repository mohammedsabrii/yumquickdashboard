import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/widget/custom_drawer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CustomDrawer()],
    );
  }
}
