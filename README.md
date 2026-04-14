# Mobile Nafanesia Work

Mobile application for **Nafanesia Academy**, built with Flutter and the **Morpheme Lite** framework. This project follows a feature-driven clean architecture to ensure scalability and maintainability.

## 🚀 Prerequisites

Before you begin, ensure you have the following installed:

-   **Flutter SDK**: `^3.38.6` (or compatible version)
-   **Dart SDK**: Compatible with your Flutter version.
-   **Morpheme CLI Lite**: The core tool for managing this project.

### Installing Morpheme CLI Lite

If you haven't installed the CLI yet, run:

```bash
dart pub global activate morpheme_cli_lite
```

Verify the installation:

```bash
morpheme_lite --version
```

## 🛠️ Installation

1.  **Clone the repository**:

    ```bash
    git clone <repository_url>
    cd mobile_nafanesia_work
    ```

2.  **Install dependencies**:

    Use the `morpheme_lite` command to get all packages and configure the project.

    ```bash
    morpheme_lite get
    ```

## 🏃‍♂️ Running the App

This project uses **flavors** (`dev`, `stag`, `prod`) to manage different environments. You strictly use `morpheme_lite` to run the application to ensure all configurations are loaded correctly.

### Development (Dev)

```bash
morpheme_lite run -f dev
```

### Staging (Stag)

```bash
morpheme_lite run -f stag
```

### Production (Prod)

```bash
morpheme_lite run -f prod
```

## 📦 Building the App

To build binaries for distribution, use the `build` command with the appropriate flavor.

### Android APK

```bash
morpheme_lite build apk -f prod
```

### Android App Bundle (AAB)

```bash
morpheme_lite build appbundle -f prod
```

### iOS (IPA)

```bash
morpheme_lite build ipa -f prod
```

## 📂 Project Structure

The project is organized by **features**, keeping related code together.

```
lib/
├── core/                # Shared logic, extensions, widgets, and themes
├── features/            # Feature-specific modules
│   ├── auth/            # Authentication feature (Login, Register, etc.)
│   ├── home/            # Home screen feature
│   ├── main/            # Main navigation container
│   └── splash/          # Splash screen
├── l10n/                # Localization files
└── main.dart            # Entry point
```

### Feature Anatomy

Each feature directory typically contains:

-   **cubit/**: State management logic.
-   **data/**: Repositories and data sources.
-   **mapper/**: Maps data models to domain entities.
-   **page/**: The UI screens.
-   **widgets/**: Widgets specific to this feature.

## ⚡ Code Generation Tools

This project relies on code generation to maintain type safety and speed up development. Configuration for these tools is found in `morpheme.yaml`.

### 1. JSON to Dart (`json2dart`)

Generates API models and services from JSON files.

-   **Config**: `json2dart/json2dart.yaml`
-   **JSON Files**: Place raw JSON response/body files in `json2dart/json/`.
-   **Run Generator**:
    ```bash
    morpheme_lite json2dart
    ```

### 2. Assets Generation

Generates a class to access assets safely.

-   **Config**: `assets` section in `morpheme.yaml`.
-   **Run Generator**:
    ```bash
    morpheme_lite assets
    ```

### 3. Localization (`l10n`)

Generates localization delegates from ARB files.

-   **Config**: `localization` section in `morpheme.yaml`.
-   **Source**: `assets/l10n/id.arb` (and other languages).
-   **Run Generator**:
    ```bash
    morpheme_lite l10n
    ```

### 4. Colors (`color2dart`)

Generates type-safe color constants.

-   **Config**: `color2dart` section in `morpheme.yaml`
-   **Source**: `color2dart/` directory.
-   **Run Generator**:
    ```bash
    morpheme_lite color2dart
    ```

## 🧪 Testing

Run unit and widget tests:

```bash
flutter test
```

## 🤝 Contributing

1.  **Create a feature branch**: `git checkout -b feature/my-new-feature`
2.  **Commit your changes**: `git commit -m 'Add some feature'`
3.  **Push to the branch**: `git push origin feature/my-new-feature`
4.  **Open a Pull Request**.

---

**Note**: Always check `morpheme.yaml` for the latest configuration settings regarding environments and tools.
