import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/manger/cubit/offers_cubit/offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_category_item.dart';

class AddOfferCargorys extends StatelessWidget {
  const AddOfferCargorys({super.key});

  static const List<String> categoriesTitel = [
    'snacks',
    'vegan',
    'meal',
    'drinks',
    'dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.243,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.0169,
        horizontal: MediaQuery.sizeOf(context).width * 0.0194,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: AppStayls.styleInterBold16(
              context,
            ).copyWith(color: AppColor.kDarkRed),
          ),
          const SizedBox(height: 24),

          ...List.generate(
            categoriesTitel.length,
            (index) => AddProdactCategoryItem(
              title: categoriesTitel[index],
              isSelected:
                  BlocProvider.of<AddOffersCubit>(
                    context,
                  ).selectedCategoryName ==
                  categoriesTitel[index],
              onChanged: (value) {
                if (value == true) {
                  BlocProvider.of<AddOffersCubit>(
                    context,
                  ).selectCategory(categoriesTitel[index]);
                } else {
                  BlocProvider.of<AddOffersCubit>(context).selectCategory(null);
                }
              },
            ),
          ),

          const SizedBox(height: 22),
          Divider(color: Colors.grey, thickness: 1),
        ],
      ),
    );
  }
}
