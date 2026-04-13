import 'cart.dart';
import 'cart_item.dart';

abstract interface class CartRepository {
  Future<Cart> getCart();
  Future<Cart> addItem(CartItem item);
  Future<Cart> removeItem(String productId);
  Future<Cart> clearCart();
}
