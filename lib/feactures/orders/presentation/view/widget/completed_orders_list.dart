import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/completed_orders_bloc_builder.dart';

class CompletedOrdersList extends StatefulWidget {
  const CompletedOrdersList({super.key});

  @override
  State<CompletedOrdersList> createState() => _OnTrackListState();
}

class _OnTrackListState extends State<CompletedOrdersList> {
  String? selectedValue;
  Timer? refreshTimer;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CompletedOrdersCubit>(context).fetchCompletedOrders();

    refreshTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      BlocProvider.of<CompletedOrdersCubit>(
        context,
      ).fetchCompletedOrdersSilently();
    });
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }

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
              const CompletedOrdersBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
