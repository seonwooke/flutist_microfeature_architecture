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
  const CartSuccess();
}

final class CartFailure extends CartState {
  const CartFailure(this.message);
  final String message;
}
