import 'package:cart_interface/cart_interface.dart';

class CartRepositoryImpl implements CartRepository {
  Cart _cart = const Cart();

  @override
  Future<Cart> getCart() async => _cart;

  @override
  Future<Cart> addItem(CartItem item) async {
    final existing = _cart.items.indexWhere((i) => i.productId == item.productId);
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
    _cart = Cart(items: _cart.items.where((i) => i.productId != productId).toList());
    return _cart;
  }

  @override
  Future<Cart> clearCart() async {
    _cart = const Cart();
    return _cart;
  }
}
