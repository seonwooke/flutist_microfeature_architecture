import 'cart_item.dart';

class Cart {
  const Cart({this.items = const []});
  final List<CartItem> items;

  double get total =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Cart && items == other.items;

  @override
  int get hashCode => items.hashCode;
}
