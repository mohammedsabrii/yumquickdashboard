import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/dashboard_header.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.0325,
        horizontal: MediaQuery.sizeOf(context).width * 0.0277,
      ),
      child: Column(children: [DashboardHeader()]),
    );
  }
}
