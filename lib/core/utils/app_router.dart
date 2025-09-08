import 'package:go_router/go_router.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/edit_product_dialog.dart';
import 'package:yumquickdashboard/feactures/home/presentation/view/home_view.dart';
import 'package:yumquickdashboard/feactures/splash/presentation/view/spalsh_view.dart';

class AppRouter {
  static const kHomeView = '/HomeView';
  static const kAddProdactView = '/AddProdactView';
  static const kEditProdactView = '/EditProdactView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SpalshView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      // GoRoute(
      //   path: kEditProdactView,
      //   builder: (context, state) => EditProductDialog(),
      // ),
    ],
  );
}
