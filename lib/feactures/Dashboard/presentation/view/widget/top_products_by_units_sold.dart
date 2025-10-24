import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/cubit/get_top_selling_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/widget/top_products_by_units_sold_teble_row_header.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/widget/order_empty.dart';

class TopProductsByUnitsSold extends StatelessWidget {
  const TopProductsByUnitsSold({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.347,
      height: MediaQuery.sizeOf(context).height * 0.47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.035,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: BlocConsumer<GetTopSellingCubit, GetTopSellingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetTopSellingEmpty) {
              return OrderEmpty();
            } else if (state is GetTopSellingSuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Products by Units Sold',
                      style: AppStayls.styleInterBold16(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
                    Table(
                      children: [
                        topProductsByUnitsSoldtableRowHeader(context),
                        ...List.generate(
                          5,
                          (index) => topProductsByUnitsSoldTableRow(
                            context,
                            ordersEntity: state.topSellingProducts[index],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is GetTopSellingFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kMainColor),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(color: AppColor.kMainColor),
            );
          },
        ),
      ),
    );
  }
}
