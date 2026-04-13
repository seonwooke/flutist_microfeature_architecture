import 'package:cart_interface/cart_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cart_bloc.dart';
import '../../bloc/cart_event.dart';
import '../../bloc/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () => context.read<CartBloc>().add(CartCleared()),
          ),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return switch (state) {
            CartInitial() => const SizedBox.shrink(),
            CartLoading() => const Center(child: CircularProgressIndicator()),
            CartSuccess(cart: final cart) => cart.items.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : _CartList(cart: cart),
            CartFailure(message: final message) =>
              Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({required this.cart});

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('Qty: ${item.quantity}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => context
                          .read<CartBloc>()
                          .add(CartItemRemoved(item.productId)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${cart.total.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              FilledButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
