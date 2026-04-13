import 'package:product_interface/product_interface.dart';

class FakeProductRepository implements ProductRepository {

  FakeProductRepository({
    List<Product>? products,
    Exception? error,
  })  : _products = products ?? [],
        _error = error;
  final List<Product> _products;
  final Exception? _error;

  @override
  Future<List<Product>> getProducts() async {
    if (_error != null) throw _error;
    return _products;
  }

  @override
  Future<Product> getProductById(String id) async {
    if (_error != null) throw _error;
    return _products.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Product not found: $id'),
    );
  }
}
