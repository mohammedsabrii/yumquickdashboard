import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_prodact_contanier.dart';

Future<String?> showDeleteProductDialogMethod(
  BuildContext context, {
  required String id,
}) async {
  String? selected = await showDialog<String>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        elevation: 0,
        backgroundColor: AppColor.kPinkishOrange.withOpacity(0.7),

        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
            ),
            child: Column(
              spacing: 20,
              children: [
                Text(
                  'Are you sure you want to delete this product?',
                  style: AppStayls.styleInterRegular16(
                    context,
                  ).copyWith(color: AppColor.kDarkRed),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomProdactContainer(
                      textColor: Colors.white,
                      title: 'Cancel',
                      backgroundColor: AppColor.kYellowBase,
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    SizedBox(width: 30),
                    CustomProdactContainer(
                      textColor: Colors.white,
                      title: 'Delete',
                      backgroundColor: AppColor.kMainColor,
                      onTap: () async {
                        final SupabaseClient supabase =
                            Supabase.instance.client;
                        await supabase.from('products').delete().eq('id', id);
                        GoRouter.of(context).pop();
                        BlocProvider.of<ProductsCubit>(context).loadProducts();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
  return selected;
}
