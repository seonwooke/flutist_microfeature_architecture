import 'package:flutist/flutist.dart';

final package = Package(
  name: 'flutist_microfeature_architecture_v3',
  dependencies: [
    Dependency(name: 'dio', version: '^5.4.0'),
    Dependency(name: 'flutter_bloc', version: '^8.1.4'),
    Dependency(name: 'equatable', version: '^2.0.5'),
    Dependency(name: 'mocktail', version: '^1.0.3'),
  ],
  modules: [
    // Modules are auto-registered when you run flutist create
    Module(name: 'network_interface'),
    Module(name: 'network_implementation'),
    Module(name: 'network_testing'),
    Module(name: 'network_tests'),
    Module(name: 'product_interface'),
    Module(name: 'product_implementation'),
    Module(name: 'product_testing'),
    Module(name: 'product_tests'),
    Module(name: 'product_example'),
    Module(name: 'cart_interface'),
    Module(name: 'cart_implementation'),
    Module(name: 'cart_testing'),
    Module(name: 'cart_tests'),
    Module(name: 'cart_example'),
  ],
);
