import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_view_body.dart';

class AddProdactView extends StatelessWidget {
  const AddProdactView({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: AddProdactViewBody(onClose: onClose)),
    );
  }
}
