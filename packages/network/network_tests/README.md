<div align="center">

<img src="https://raw.githubusercontent.com/seonwooke/flutist/release/1.0.0/assets/flutist_banner.png" alt="Flutist Banner" width="50%">

</div>

Module in Flutist workspace.

## 📋 Overview

This module is part of the Flutist workspace project. Dependencies are managed centrally in the root `package.dart` file.

## 🏗️ Scaffold Type

**Type:** `lite`

This is a **lite module** with a 4-layer Microfeature lite Architecture:
- **Interface Layer** - Public API and contracts
- **Implementation Layer** - Core functionality
- **Tests Layer** - Unit and integration tests
- **Testing Layer** - Test utilities and helpers


## 📦 Dependencies

Dependencies for this module are defined in the root `project.dart` file. To add dependencies:

1. Edit `project.dart` and add dependencies to this module's configuration
2. Run `flutist generate` to sync the changes

## 🚀 Usage

This module can be imported and used by other modules in the workspace:

```dart
import 'package:network_tests/network_tests.dart';
```

## 📁 Structure

```
network_tests/
├── network_tests_interface/      # Interface layer
│   └── lib/
├── network_tests_implementation/ # Implementation layer
│   └── lib/
├── network_tests_tests/          # Tests layer
│   └── lib/
└── network_tests_testing/        # Testing layer
    └── lib/
```


## 🔧 Development

When working on this module:

1. Make your changes in the module's source files
2. Run `flutist generate` to ensure dependencies are synced
3. Test the module in isolation or as part of the main app

## 📝 Notes

- This module follows the Flutist workspace conventions
- All dependencies are managed at the workspace level
- Module-specific configuration can be found in this module's `pubspec.yaml`
