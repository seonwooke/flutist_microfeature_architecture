sealed class ProductDetailEvent {}

final class ProductDetailStarted extends ProductDetailEvent {
  ProductDetailStarted(this.productId);
  final String productId;
}
