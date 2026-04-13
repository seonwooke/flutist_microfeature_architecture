import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_implementation/product_implementation.dart';
import 'package:product_interface/product_interface.dart';

void main() {
  runApp(const ProductExampleApp());
}

class ProductExampleApp extends StatelessWidget {
  const ProductExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Example',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: RepositoryProvider<ProductRepository>(
        create: (_) => const ProductRepositoryImpl(),
        child: const ProductListPage(),
      ),
    );
  }
}
