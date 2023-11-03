part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;
  final double? total;

  ProductsSuccess({required this.products, @required this.total});
}

final class ProductsFailure extends ProductsState {
  final String errorMessage;

  ProductsFailure({required this.errorMessage});
}
