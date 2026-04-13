import 'package:flutist/flutist.dart';

final package = Package(
  name: 'flutist_microfeature_architecture_v3',
  dependencies: [
    // Example)
    // Dependency(name: 'intl', version: '^20.2.0'),
    // Dependency(name: 'test', version: '^1.28.0'),
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
  ],
);