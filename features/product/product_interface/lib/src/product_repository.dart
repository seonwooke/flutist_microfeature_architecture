import 'product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String id);
}
