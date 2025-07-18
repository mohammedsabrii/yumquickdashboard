import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/prodact_list.dart';

class ProdactsView extends StatelessWidget {
  const ProdactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.027,
          horizontal: MediaQuery.sizeOf(context).width * 0.027,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Proacts', style: AppStayls.styleInterBold24(context)),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
            ProdactList(),
          ],
        ),
      ),
    );
  }
}
