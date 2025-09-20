import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/manger/cubit/get_offers_cubit/get_offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/empty_offer_list_view.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/offers_list.dart';

class OfffersViewBodyBlocBuilder extends StatelessWidget {
  const OfffersViewBodyBlocBuilder({super.key, this.onTap});
  final Function()? onTap;
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
          if (state.getOffers.isNotEmpty) {
            return OffersList(offers: state.getOffers);
          } else {
            return EmptyOfferListView(onTap: onTap);
          }
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
