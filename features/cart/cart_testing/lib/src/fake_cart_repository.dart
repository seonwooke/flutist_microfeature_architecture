import 'package:cart_interface/cart_interface.dart';

class FakeCartRepository implements CartRepository {
  FakeCartRepository({
    Cart? cart,
    Exception? error,
  })  : _cart = cart ?? const Cart(),
        _error = error;
  Cart _cart;
  final Exception? _error;

  @override
  Future<Cart> getCart() async {
    if (_error != null) throw _error;
    return _cart;
  }

  @override
  Future<Cart> addItem(CartItem item) async {
    if (_error != null) throw _error;
    final existing =
        _cart.items.indexWhere((i) => i.productId == item.productId);
    List<CartItem> updated;
    if (existing >= 0) {
      updated = List.of(_cart.items);
      updated[existing] = updated[existing].copyWith(
        quantity: updated[existing].quantity + item.quantity,
      );
    } else {
      updated = [..._cart.items, item];
    }
    _cart = Cart(items: updated);
    return _cart;
  }

  @override
  Future<Cart> removeItem(String productId) async {
    if (_error != null) throw _error;
    _cart = Cart(
        items: _cart.items.where((i) => i.productId != productId).toList());
    return _cart;
  }

  @override
  Future<Cart> clearCart() async {
    if (_error != null) throw _error;
    _cart = const Cart();
    return _cart;
  }
}
