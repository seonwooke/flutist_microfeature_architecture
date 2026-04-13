import 'package:product_interface/product_interface.dart';

sealed class ProductListState {
  const ProductListState();
}

final class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

final class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

final class ProductListSuccess extends ProductListState {
  const ProductListSuccess(this.products);
  final List<Product> products;
}

final class ProductListFailure extends ProductListState {
  const ProductListFailure(this.message);
  final String message;
}
