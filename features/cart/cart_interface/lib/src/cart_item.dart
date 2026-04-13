class CartItem {
  const CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });
  final String productId;
  final String name;
  final double price;
  final int quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      productId: productId,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          productId == other.productId &&
          name == other.name &&
          price == other.price &&
          quantity == other.quantity;

  @override
  int get hashCode => Object.hash(productId, name, price, quantity);
}
