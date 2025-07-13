import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_router.dart';

void main() {
  runApp(const YumQuickDashBoard());
}

class YumQuickDashBoard extends StatelessWidget {
  const YumQuickDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
