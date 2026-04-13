import 'package:product_interface/product_interface.dart';

sealed class ProductDetailState {
  const ProductDetailState();
}

final class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

final class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

final class ProductDetailSuccess extends ProductDetailState {
  const ProductDetailSuccess(this.product);
  final Product product;
}

final class ProductDetailFailure extends ProductDetailState {
  const ProductDetailFailure(this.message);
  final String message;
}
