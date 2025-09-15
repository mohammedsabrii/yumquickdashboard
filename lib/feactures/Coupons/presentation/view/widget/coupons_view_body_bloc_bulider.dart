import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/manger/cubit/get_offers_cubit/get_offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/all_offers_table_header.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/all_offers_table_row.dart';

class OfffersViewBodyBlocBuilder extends StatelessWidget {
  const OfffersViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetOffersCubit>(context).getOffers();
    return BlocBuilder<GetOffersCubit, GetOffersState>(
      builder: (context, state) {
        if (state is GetOffersLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColor.kMainColor),
          );
        } else if (state is GetOffersSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Offers',
                style: AppStayls.styleInterBold20(
                  context,
                ).copyWith(color: AppColor.kDarkRed),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0193),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.2),
                  1: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.15),
                  2: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.08),
                  3: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.12),
                  4: FixedColumnWidth(MediaQuery.sizeOf(context).width * 0.16),
                },
                children: [
                  allOfferssTableHeader(context),
                  ...List.generate(
                    state.getOffers.length,
                    (index) => allOffersTableRow(
                      context,
                      offersEntity: state.getOffers[index],
                      deleteIcononTap: () {},
                      editIcononTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is GetOffersFailure) {
          return Text(
            state.errorMessage,
            style: AppStayls.styleInterBold20(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          );
        }
        return SizedBox();
      },
    );
  }
}
