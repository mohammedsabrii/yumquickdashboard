import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_container.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/add_offer_view.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/widget/coupons_view_body_bloc_bulider.dart';

class OffersViewBody extends StatefulWidget {
  const OffersViewBody({super.key});

  @override
  State<OffersViewBody> createState() => _OffersViewBodyState();
}

class _OffersViewBodyState extends State<OffersViewBody> {
  bool showAddOffer = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height * 0.028,
              horizontal: MediaQuery.sizeOf(context).width * 0.027,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Offers',
                      style: AppStayls.styleInterBold24(
                        context,
                      ).copyWith(color: AppColor.kDarkRed),
                    ),
                    Spacer(),
                    CustomContainer(
                      title: 'Add Offer',
                      onTap: () {
                        setState(() {
                          showAddOffer = true;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.027),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.77,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.sizeOf(context).height * 0.027,
                      horizontal: MediaQuery.sizeOf(context).width * 0.019,
                    ),
                    child: OfffersViewBodyBlocBuilder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showAddOffer)
          Positioned(
            child: AddOfferView(
              onClose: () {
                setState(() {
                  showAddOffer = false;
                });
              },
            ),
          ),
      ],
    );
  }
}
