import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_brodact_view_header.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_information.dart';

class AddProdactViewBody extends StatelessWidget {
  const AddProdactViewBody({super.key, required this.onClose});
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.018,
        horizontal: MediaQuery.sizeOf(context).width * 0.027,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddProdactViewHeader(onClose: onClose),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.018),
            AddProdactInformation(),
          ],
        ),
      ),
    );
  }
}
