import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yumquickdashboard/core/utils/app_assets.dart';
import 'package:yumquickdashboard/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AppAssets.kLogo));
  }
}
