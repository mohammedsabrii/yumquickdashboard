import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/feactures/splash/presentation/view/widget/spalash_view_body.dart';

class SpalshView extends StatelessWidget {
  const SpalshView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kMainColor,
        body: SplashViewBody(),
      ),
    );
  }
}
