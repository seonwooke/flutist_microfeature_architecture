import 'package:product_interface/product_interface.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  @override
  Future<List<Product>> getProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _fakeProducts;
  }

  @override
  Future<Product> getProductById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return _fakeProducts.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Product not found: $id'),
    );
  }

  static const List<Product> _fakeProducts = [
    Product(
      id: '1',
      name: 'Flutter in Action',
      description: 'A comprehensive guide to building Flutter apps from scratch.',
      price: 39.99,
      imageUrl: 'https://picsum.photos/seed/flutter/400/300',
    ),
    Product(
      id: '2',
      name: 'Clean Architecture',
      description: 'Learn how to build maintainable and testable software.',
      price: 34.99,
      imageUrl: 'https://picsum.photos/seed/clean/400/300',
    ),
    Product(
      id: '3',
      name: 'Dart Programming',
      description: 'Master Dart from beginner to advanced topics.',
      price: 29.99,
      imageUrl: 'https://picsum.photos/seed/dart/400/300',
    ),
    Product(
      id: '4',
      name: 'State Management',
      description: 'Comparing BLoC, Riverpod, and other solutions.',
      price: 24.99,
      imageUrl: 'https://picsum.photos/seed/state/400/300',
    ),
    Product(
      id: '5',
      name: 'Testing in Flutter',
      description: 'Unit, widget, and integration tests explained.',
      price: 19.99,
      imageUrl: 'https://picsum.photos/seed/testing/400/300',
    ),
  ];
}
