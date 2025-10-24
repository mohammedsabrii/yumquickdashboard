import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/utils/app_constant.dart';
import 'package:yumquickdashboard/core/utils/app_router.dart';
import 'package:yumquickdashboard/feactures/Customers/presentation/manger/cubit/customers_profile_info_cubit/customers_profile_info_cubit.dart';
import 'package:yumquickdashboard/feactures/Dashboard/presentation/view/manger/cubit/cubit/get_top_selling_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/edit_product_cubit/edit_product_cubit.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/manger/cubits/products_cubit/products_cubit.dart';
import 'package:yumquickdashboard/feactures/category/manger/cubit/cubit/category_product_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/active_orders_cubit/active_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/cancelled_cubit/cancelled_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/completed_orders_cubit/completed_orders_cubit.dart';
import 'package:yumquickdashboard/feactures/orders/presentation/view/manger/cubit/on_track_cubit/on_track_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        BlocProvider(create: (context) => ProductsCubit()..loadProducts()),
        BlocProvider(
          create: (context) => ActiveOrdersCubit()..fetchActiveOrders(),
        ),
        BlocProvider(
          create: (context) => CompletedOrdersCubit()..fetchCompletedOrders(),
        ),
        BlocProvider(
          create: (context) => CancelledOrdersCubit()..fetchCancelledOrders(),
        ),
        BlocProvider(create: (context) => OnTrackCubit()..fetchOnTrackOrders()),
        BlocProvider(
          create: (context) => GetTopSellingCubit()..getTopSelling(),
        ),

        BlocProvider(create: (context) => EditProductCubit()),
        BlocProvider(create: (context) => ProductsByCategoryCubit()),
        BlocProvider(
          create:
              (context) =>
                  CustomersProfileInfoCubit()..fetchCustomersInfo(context),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
