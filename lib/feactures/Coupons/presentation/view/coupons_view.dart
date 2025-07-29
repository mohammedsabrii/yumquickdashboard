import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_view_body.dart';

class CouponsView extends StatelessWidget {
  const CouponsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CouponsViewBody()));
  }
}
