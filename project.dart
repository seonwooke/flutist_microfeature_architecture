// ignore_for_file: unused_import

import 'package:flutist/flutist.dart';

import 'flutist/flutist_gen.dart';
import 'package.dart';

final project = Project(
  name: 'flutist_microfeature_architecture_v3',
  options: const ProjectOptions(),
  modules: [
    Module(
      name: 'app',
      dependencies: [
        // Example)
        // package.dependencies.intl,
      ],
      devDependencies: [
        // Example)
        // package.dependencies.test,
      ],
      modules: [
        // Example)
        // package.modules.login,
      ],
    ),
    Module(
      name: 'network_interface',
      dependencies: [],
      devDependencies: [],
      modules: [],
    ),
    Module(
      name: 'network_implementation',
      dependencies: [],
      devDependencies: [],
      modules: [
        package.modules.networkInterface,
      ],
    ),
    Module(
      name: 'network_testing',
      dependencies: [],
      devDependencies: [],
      modules: [
        package.modules.networkInterface,
      ],
    ),
    Module(
      name: 'network_tests',
      dependencies: [],
      devDependencies: [],
      modules: [
        package.modules.networkImplementation,
        package.modules.networkTesting,
      ],
    ),
  ],
);
