import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_interface/product_interface.dart';

import '../bloc/product_detail/product_detail_bloc.dart';
import '../bloc/product_detail/product_detail_event.dart';
import '../bloc/product_detail/product_detail_state.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.productId,
    this.onAddToCart,
  });

  final String productId;
  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailBloc(repository: context.read<ProductRepository>())
            ..add(ProductDetailStarted(productId)),
      child: _ProductDetailView(onAddToCart: onAddToCart),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView({this.onAddToCart});

  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return switch (state) {
            ProductDetailInitial() => const SizedBox.shrink(),
            ProductDetailLoading() =>
              const Center(child: CircularProgressIndicator()),
            ProductDetailSuccess(product: final product) =>
              _ProductDetail(product: product, onAddToCart: onAddToCart),
            ProductDetailFailure(message: final message) =>
              Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({required this.product, this.onAddToCart});

  final Product product;
  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 200,
              color: Colors.grey[200],
              child: const Center(child: Icon(Icons.inventory_2, size: 80)),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.green),
          ),
          const SizedBox(height: 16),
          Text(product.description),
          const SizedBox(height: 24),
          if (onAddToCart != null)
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => onAddToCart!(product),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
              ),
            ),
        ],
      ),
    );
  }
}
