import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/cancelled_orders_Bloc_builder.dart';

class CancelledOrdersList extends StatefulWidget {
  const CancelledOrdersList({super.key});

  @override
  State<CancelledOrdersList> createState() => _OnTrackListState();
}

class _OnTrackListState extends State<CancelledOrdersList> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.876,
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Completed orders',
                style: AppStayls.styleInterBold24(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),
              CancelledOrdersBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
