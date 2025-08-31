import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_category_item.dart';

class AddProdactCargorys extends StatelessWidget {
  const AddProdactCargorys({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categoriesTitel = const [
      'snacks',
      'vegan',
      'meal',
      'drinks',
      'dessert',
    ];

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
          ...categoriesTitel.map(
            (title) => AddProdactCategoryItem(
              title: title,

              isSelected: BlocProvider.of<AddProdactCubit>(
                context,
              ).selectedCategoryNames.contains(title),
              onChanged: (value) {
                context.read<AddProdactCubit>().toggleCategory(
                  title,
                  value ?? false,
                );
              },
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Create New',
            style: AppStayls.styleInterRegular14(
              context,
            ).copyWith(color: const Color(0xFF1E5EFF)),
          ),
        ],
      ),
    );
  }
}
