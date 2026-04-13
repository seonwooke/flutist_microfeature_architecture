import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_interface/product_interface.dart';

import '../bloc/product_list/product_list_bloc.dart';
import '../bloc/product_list/product_list_event.dart';
import '../bloc/product_list/product_list_state.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key, this.onAddToCart});

  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductListBloc(repository: context.read<ProductRepository>())
            ..add(ProductListStarted()),
      child: _ProductListView(onAddToCart: onAddToCart),
    );
  }
}

class _ProductListView extends StatelessWidget {
  const _ProductListView({this.onAddToCart});

  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                context.read<ProductListBloc>().add(ProductListRefreshed()),
          ),
        ],
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return switch (state) {
            ProductListInitial() => const SizedBox.shrink(),
            ProductListLoading() =>
              const Center(child: CircularProgressIndicator()),
            ProductListSuccess(products: final products) =>
              _ProductList(products: products, onAddToCart: onAddToCart),
            ProductListFailure(message: final message) =>
              Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({required this.products, this.onAddToCart});

  final List<Product> products;
  final void Function(Product)? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: const Icon(Icons.inventory_2),
          title: Text(product.name),
          subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => BlocProvider.value(
                  value: context.read<ProductListBloc>(),
                  child: ProductDetailPage(
                    productId: product.id,
                    onAddToCart: onAddToCart,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
