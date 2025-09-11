import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_constant.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/category_info_model.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_category_item.dart';

class AddProdactCargorys extends StatelessWidget {
  const AddProdactCargorys({super.key});

  static const List<CategorysInFormationModel> categoriesTitel = [
    CategorysInFormationModel(name: 'snacks', id: snacksId),
    CategorysInFormationModel(name: 'vegan', id: veganId),
    CategorysInFormationModel(name: 'meal', id: mealId),
    CategorysInFormationModel(name: 'drinks', id: drinksId),
    CategorysInFormationModel(name: 'dessert', id: dessertsId),
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
              title: categoriesTitel[index].name,
              isSelected:
                  BlocProvider.of<AddProductCubit>(
                        context,
                      ).selectedCategoryId ==
                      categoriesTitel[index].id &&
                  BlocProvider.of<AddProductCubit>(
                        context,
                      ).selectedCategoryName ==
                      categoriesTitel[index].name,
              onChanged: (value) {
                if (value == true) {
                  BlocProvider.of<AddProductCubit>(context).selectCategory(
                    categoriesTitel[index].id,
                    categoriesTitel[index].name,
                  );
                } else {
                  BlocProvider.of<AddProductCubit>(
                    context,
                  ).selectCategory(null, null);
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
