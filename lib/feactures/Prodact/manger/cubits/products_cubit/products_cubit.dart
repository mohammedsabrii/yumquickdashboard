import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yumquickdashboard/core/service/product_service.dart';
import 'package:yumquickdashboard/feactures/Prodact/model/prodact_table_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final productService = ProductService();

  void loadProducts() async {
    emit(ProductsLoading());
    try {
      final products = await productService.fetchProducts();
      emit(ProductsSuccess(products));
      print('Fetched ${products.length} products');
    } catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
      print('Error fetching products: $e');
    }
  }
}
