import 'package:cart_interface/cart_interface.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartSuccess extends CartState {
  const CartSuccess(this.cart);
  final Cart cart;
}

final class CartFailure extends CartState {
  const CartFailure(this.message);
  final String message;
}
