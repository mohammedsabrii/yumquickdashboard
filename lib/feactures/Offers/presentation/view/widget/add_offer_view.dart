import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/add_offers_view_body.dart';

class AddOfferView extends StatelessWidget {
  const AddOfferView({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: AddOfferViewBody(onClose: onClose)));
  }
}
