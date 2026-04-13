// ignore_for_file: unused_import

import 'package:flutist/flutist.dart';

import 'flutist/flutist_gen.dart';
import 'package.dart';

final project = Project(
  name: 'flutist_microfeature_architecture_v3',
  options: const ProjectOptions(
    compositionRoots: ['app'],
  ),
  modules: [
    // ── network (lite) ───────────────────────────────────
    Module(
      name: 'network_interface',
      dependencies: [package.dependencies.equatable],
    ),
    Module(
      name: 'network_implementation',
      dependencies: [package.dependencies.dio],
      modules: [package.modules.networkInterface],
    ),
    Module(
      name: 'network_testing',
      devDependencies: [package.dependencies.mocktail],
      modules: [package.modules.networkInterface],
    ),
    Module(
      name: 'network_tests',
      modules: [
        package.modules.networkImplementation,
        package.modules.networkTesting,
      ],
    ),

    // ── product (micro) ───────────────────────────────────
    Module(
      name: 'product_interface',
      modules: [package.modules.networkInterface],
    ),
    Module(
      name: 'product_implementation',
      dependencies: [package.dependencies.flutterBloc],
      modules: [
        package.modules.productInterface,
        package.modules.networkInterface,
      ],
    ),
    Module(
      name: 'product_testing',
      devDependencies: [package.dependencies.mocktail],
      modules: [package.modules.productInterface],
    ),
    Module(
      name: 'product_tests',
      modules: [
        package.modules.productImplementation,
        package.modules.productTesting,
      ],
    ),
    Module(
      name: 'product_example',
      modules: [
        package.modules.productImplementation,
        package.modules.productTesting,
      ],
    ),

    // ── cart (micro) ──────────────────────────────────────
    Module(
      name: 'cart_interface',
      modules: [package.modules.networkInterface],
    ),
    Module(
      name: 'cart_implementation',
      dependencies: [package.dependencies.flutterBloc],
      modules: [
        package.modules.cartInterface,
        package.modules.networkInterface,
      ],
    ),
    Module(
      name: 'cart_testing',
      devDependencies: [package.dependencies.mocktail],
      modules: [package.modules.cartInterface],
    ),
    Module(
      name: 'cart_tests',
      modules: [
        package.modules.cartImplementation,
        package.modules.cartTesting,
      ],
    ),
    Module(
      name: 'cart_example',
      modules: [
        package.modules.cartImplementation,
        package.modules.cartTesting,
      ],
    ),

    // ── app (composition root) ────────────────────────────
    Module(
      name: 'app',
      modules: [
        package.modules.productImplementation,
        package.modules.cartImplementation,
        package.modules.networkImplementation,
      ],
    ),
  ],
);
