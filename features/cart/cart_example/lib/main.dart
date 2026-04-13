import 'package:cart_implementation/cart_implementation.dart';
import 'package:cart_interface/cart_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const CartExampleApp());
}

class CartExampleApp extends StatelessWidget {
  const CartExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Example',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: RepositoryProvider<CartRepository>(
        create: (_) => CartRepositoryImpl(),
        child: BlocProvider(
          create: (context) =>
              CartBloc(repository: context.read<CartRepository>())
                ..add(CartStarted()),
          child: const CartPage(),
        ),
      ),
    );
  }
}
