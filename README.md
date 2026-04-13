<div align="center">

<img src="https://raw.githubusercontent.com/seonwooke/flutist/release/1.0.0/assets/flutist_banner.png" alt="Flutist Banner">

**A Flutter project managed by Flutist**

[![Version](https://img.shields.io/badge/version-1.0.0+1-blue.svg)](pubspec.yaml)
[![Flutter](https://img.shields.io/badge/Flutter-^3.5.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%3E%3D3.5.0%20%3C4.0.0-blue.svg)](https://dart.dev)

</div>

## 📋 About

flutist_microfeature_architecture_v3 is a Flutter workspace project built with Flutist, a powerful project management framework for Flutter applications. This project follows a modular architecture pattern, making it easy to scale and maintain.

## ✨ Features

- 🏗️ **Modular Architecture** - Organized codebase with clear module separation
- 📦 **Workspace Management** - Centralized dependency management
- 🎨 **Code Generation** - Scaffold templates for rapid development
- 🔗 **Dependency Graph** - Visualize module dependencies
- 🚀 **Fast Development** - Streamlined workflow with Flutist CLI

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.5.0 or higher)
- Dart SDK (^3.5.0 or higher)
- Flutist CLI installed

### Installation

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Generate workspace files:**
   ```bash
   flutist generate
   ```

## 📁 Project Structure

```
flutist_microfeature_architecture_v3/
├── app/                    # Main application module
├── project.dart            # Project configuration
├── package.dart            # Centralized dependencies
├── pubspec.yaml            # Root workspace configuration
├── analysis_options.yaml   # Linting rules
├── flutist/
│   ├── templates/          # Scaffold templates
│   └── flutist_gen.dart    # Generated code (auto-generated)
└── README.md               # This file
```

### Key Files

- **`project.dart`** - Defines all modules and their dependencies
- **`package.dart`** - Central repository for all package dependencies
- **`pubspec.yaml`** - Workspace configuration for Flutter
- **`flutist/templates/`** - Custom scaffold templates for code generation

## 🛠️ Available Commands

| Command | Description |
|---------|-------------|
| `flutist init` | Initialize a new Flutist project |
| `flutist create` | Create a new module in the project |
| `flutist generate` | Sync all pubspec.yaml files based on project.dart |
| `flutist pub add <package>` | Add a dependency to package.dart |
| `flutist scaffold <template>` | Generate code from templates |
| `flutist graph` | Generate dependency graph visualization |
| `flutist help` | Show help information |

### Examples

```bash
# Create a new clean module
flutist create --path features --name login --options clean

# Add a new dependency
flutist pub add http

# Generate code from template
flutist scaffold feature --name user_profile

# Visualize dependencies
flutist graph --format mermaid
```

## 📦 Module Types

This project supports different module types:

- **`clean`** - Clean Architecture module with Domain, Data, Presentation layers
- **`micro`** - Microfeature Architecture module with Example, Interface, Implementation, Tests, Testing layers
- **`lite`** - Microfeature lite module with Interface, Implementation, Tests, Testing layers
- **`simple`** - Simple module with only lib folder
- **`custom`** - Custom module with custom template

## 🔧 Development

### Adding Dependencies

Dependencies are managed centrally in `package.dart`. To add a new dependency:

```bash
flutist pub add <package_name>
```

Then run `flutist generate` to sync the changes to all modules.

### Creating Modules

```bash
# Create a simple module
flutist create --path lib --name utils --options simple

# Create a clean module
flutist create --path features --name authentication --options clean
```

### Code Generation

Use scaffold templates to generate boilerplate code:

```bash
# List available templates
flutist scaffold list

# Generate from template
flutist scaffold feature --name login
```

## 📚 Documentation

For more information about Flutist, visit the [official documentation](https://github.com/flutist/flutist).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.

---

**Built with ❤️ using Flutist**
