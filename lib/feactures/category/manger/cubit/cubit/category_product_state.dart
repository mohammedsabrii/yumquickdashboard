part of 'category_product_cubit.dart';

@immutable
abstract class ProductsByCategoryState {}

class ProductsByCategoryInitial extends ProductsByCategoryState {}

class ProductsByCategoryLoading extends ProductsByCategoryState {}

class ProductsByCategorySuccess extends ProductsByCategoryState {
  final List<ProductEntity> products;
  ProductsByCategorySuccess(this.products);
}

class ProductsByCategoryFailure extends ProductsByCategoryState {
  final String errorMessage;
  ProductsByCategoryFailure(this.errorMessage);
}
