import 'package:cart_implementation/cart_implementation.dart';
import 'package:cart_interface/cart_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_implementation/product_implementation.dart';
import 'package:product_interface/product_interface.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (_) => const ProductRepositoryImpl(),
        ),
        RepositoryProvider<CartRepository>(
          create: (_) => CartRepositoryImpl(),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            CartBloc(repository: context.read<CartRepository>())
              ..add(CartStarted()),
        child: MaterialApp(
          title: 'Flutist Shop',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const _ShopShell(),
        ),
      ),
    );
  }
}

class _ShopShell extends StatefulWidget {
  const _ShopShell();

  @override
  State<_ShopShell> createState() => _ShopShellState();
}

class _ShopShellState extends State<_ShopShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          ProductListPage(),
          CartPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.store),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
