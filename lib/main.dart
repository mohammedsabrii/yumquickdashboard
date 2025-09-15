import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/utils/app_constant.dart';
import 'package:yumquickdashboard/core/utils/app_router.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/manger/cubit/get_offers_cubit/get_offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Coupons/presentation/view/manger/cubit/offers_cubit/offers_cubit.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/category/manger/cubit/cubit/category_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supbaseUrl, anonKey: supbaseAnonKey);
  runApp(const YumQuickDashBoard());
}

class YumQuickDashBoard extends StatelessWidget {
  const YumQuickDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddProductCubit()),
        BlocProvider(create: (context) => ProductsCubit()),
        BlocProvider(create: (context) => EditProductCubit()),
        BlocProvider(create: (context) => ProductsByCategoryCubit()),
        BlocProvider(create: (context) => CustomersProfileInfoCubit()),
        BlocProvider(create: (context) => AddOffersCubit()),
        BlocProvider(create: (context) => GetOffersCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
