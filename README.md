# Flutter HRIS Application

A modern, robust Human Resource Information System (HRIS) mobile application built with Flutter and the **Morpheme Lite** framework. This application features location-based attendance tracking, real-time presence monitoring, and comprehensive employee history and profile management.

## ✨ Key Features

*   **Secure Authentication**: Secure login flow ensuring employee data privacy.
*   **Live Dashboard**: Real-time clock and employee status on the home screen.
*   **Smart Attendance (Clock In/Out)**:
    *   **Geolocation Integration**: Verifies employee location using precise GPS coordinates before allowing attendance submission.
    *   **Map Visualization**: Interactive map displaying the user's current location.
    *   **Photo Verification**: Integrates camera functionality to capture real-time photos as proof of presence.
*   **Attendance History**: Comprehensive view of past attendance records and logs.
*   **Profile Management**: Employee profile section to view user details.
*   **Clean Architecture**: Built with a feature-driven, clean architecture for high maintainability and scalability.

## 📱 Tech Stack & Libraries

*   **Framework**: Flutter (`^3.10.7`)
*   **Architecture & CLI**: Morpheme Lite (`morpheme_cli_lite`)
*   **State Management**: Bloc / Cubit (`morpheme_base`)
*   **Navigation**: GoRouter (`go_router`)
*   **Service Locator**: GetIt (`get_it`)
*   **Location Services**: `geolocator`, `geocoding`, `flutter_map`
*   **Media**: `image_picker`
*   **Storage**: `flutter_secure_storage`
*   **UI Components**: `skeletonizer`, `flutter_svg`, `google_fonts`

## 🚀 Prerequisites

Before you begin, ensure you have the following installed:

*   **Flutter SDK**: `^3.10.7` (or compatible version)
*   **Dart SDK**: Compatible with your Flutter version.
*   **Morpheme CLI Lite**: The core tool for managing this project.

### Installing Morpheme CLI Lite

If you haven't installed the CLI yet, run:

```bash
dart pub global activate morpheme_cli_lite
```

Verify the installation:

```bash
morpheme_lite --version
```

## 🛠️ Installation & Setup

1.  **Clone the repository**:

    ```bash
    git clone <repository_url>
    cd flutter_hris
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

### iOS (IPA)
```bash
morpheme_lite build ipa -f prod
```

## 📂 Project Structure

The project is organized by **features**, keeping related code together.

```text
lib/
├── core/                # Shared logic, constants, extensions, themes, and components
├── features/            # Feature-specific modules
│   ├── auth/            # Authentication (Login)
│   ├── history/         # Attendance log history
│   ├── home/            # Dashboard & Attendance (Clock In/Out, Maps, Camera)
│   ├── main/            # Bottom navigation and routing setup
│   ├── profile/         # Employee profile details
│   └── splash/          # Initial splash screen
├── l10n/                # Localization files
└── main.dart            # Entry point
```

### Feature Anatomy

Each feature directory typically contains:
*   **cubit/**: State management logic.
*   **data/**: Repositories and data sources.
*   **domain/**: Domain models and entities.
*   **presentation/pages/**: The UI screens.
*   **presentation/widgets/**: Widgets specific to this feature.

## ⚡ Code Generation Tools

This project relies on code generation to maintain type safety and speed up development. Configuration for these tools is found in `morpheme.yaml`.

*   **JSON to Dart**: `morpheme_lite json2dart`
*   **Assets Generation**: `morpheme_lite assets`
*   **Localization (l10n)**: `morpheme_lite l10n`
*   **Colors (color2dart)**: `morpheme_lite color2dart`

## 🧪 Testing

Run unit and widget tests:

```bash
flutter test
```
