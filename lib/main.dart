import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yumquickdashboard/core/utils/app_constant.dart';
import 'package:yumquickdashboard/core/utils/app_router.dart';
import 'package:yumquickdashboard/feactures/Prodact/manger/cubits/add_prodact_cubit/add_prodact_cubit.dart';

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
      providers: [BlocProvider(create: (context) => AddProdactCubit())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
