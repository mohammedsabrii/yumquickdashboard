import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/offers_view_body.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: OffersViewBody()));
  }
}
