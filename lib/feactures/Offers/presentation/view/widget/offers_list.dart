import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Offers/entity/offers_entity.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/all_offers_table_header.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/all_offers_table_row.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/delete_offer_dialog.dart';
import 'package:yumquickdashboard/feactures/Offers/presentation/view/widget/edit_offer_dialog.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key, required this.offers});
  final List<OffersEntity> offers;
  @override
  Widget build(BuildContext context) {
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
              offers.length,
              (index) => allOffersTableRow(
                context,
                offersEntity: offers[index],
                deleteIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => DeleteOfferDailog(id: offers[index].id),
                  );
                },
                editIcononTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) =>
                            EditOfferDialog(offersEntity: offers[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
