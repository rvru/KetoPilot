# KetoPilot 🚀

A sophisticated Flutter application for metabolic health optimization, focused on gram-centric macro tracking and biomarker monitoring for ketogenic therapy.

## 📱 Features

### Core Functionality
- **Gram-Centric Tracking**: Focus on grams rather than calories for precise macro management
- **Smart Goal System**: Different approaches for carbs (limits) vs protein/fat (goals)
- **Biomarker Monitoring**: Track glucose, BHB (ketones), and GKI (Glucose Ketone Index)
- **Real-time Health Status**: Color-coded indicators for optimal, good, and high ranges
- **Animated Progress Bars**: Beautiful visual feedback for daily nutrition progress

### UI/UX Excellence
- **Professional Medical Theme**: Clean, medical-grade green color scheme
- **Responsive Design**: Optimized for all screen sizes from iPhone SE to iPad Pro
- **Dynamic Island Support**: Header layout optimized for modern iPhone designs
- **MacroFactor-Inspired Interface**: Clean, intuitive data entry experience
- **Animated Visualizations**: Smooth progress indicators and status animations

### Technical Features
- **Clean Architecture**: Feature-based organization with clear separation of concerns
- **Cross-Platform**: Runs on iOS, Android, macOS, Web, Windows, and Linux
- **Modern Flutter**: Built with latest Flutter SDK and best practices
- **State Management**: Efficient state handling with proper data flow
- **Freezed Integration**: Immutable data models with JSON serialization

## 🛠 Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK** (>=3.19.0): [Installation Guide](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (>=3.3.0): Included with Flutter
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA
- **Platform-specific requirements**:
  - **iOS**: Xcode 15.0+ (macOS only)
  - **Android**: Android Studio with Android SDK
  - **Web**: Chrome browser
  - **Desktop**: Platform-specific tooling

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/priyamthakkar2001/KetoPilot.git
cd KetoPilot
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Required Files
```bash
# Generate code for auto_route, freezed, and json_annotation
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Verify Installation
```bash
# Check if Flutter is properly configured
flutter doctor

# List available devices
flutter devices
```

## 📱 Running the App

### iOS Simulator
```bash
# Start iOS simulator and run
flutter run -d ios

# Or specify a specific simulator
flutter run -d "iPhone 15 Pro"
```

### Android Emulator
```bash
# Start Android emulator and run
flutter run -d android

# Or specify a specific emulator
flutter run -d emulator-5554
```

### Web Browser
```bash
# Run in Chrome (default)
flutter run -d chrome

# Run in web mode with specific renderer
flutter run -d web-server --web-port 8080
```

### Desktop Platforms
```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Linux
flutter run -d linux
```

## 📁 Project Structure

```
lib/
├── core/                          # Core functionality
│   ├── constants/                 # App-wide constants
│   ├── router/                    # Navigation routing
│   └── themes/                    # App theming
├── features/                      # Feature modules
│   ├── auth/                      # Authentication
│   ├── dashboard/                 # Main dashboard
│   │   ├── data/                  # Data layer
│   │   ├── domain/                # Business logic
│   │   └── presentation/          # UI components
│   │       ├── pages/             # Screen pages
│   │       └── widgets/           # Reusable widgets
│   ├── data_entry/                # Data input screens
│   ├── food_diary/                # Food tracking
│   ├── health_logging/            # Health metrics
│   ├── onboarding/                # User onboarding
│   └── settings/                  # App settings
├── shared/                        # Shared components
│   ├── extensions/                # Dart extensions
│   ├── utils/                     # Utility functions
│   └── widgets/                   # Common widgets
└── main.dart                      # App entry point
```

## 🔧 Configuration

### Environment Setup
Create configuration files for different environments:

1. **Development**: Default configuration
2. **Staging**: Testing environment
3. **Production**: Live app configuration

### API Configuration
Update API endpoints in `lib/core/constants/app_constants.dart`:

```dart
class AppConstants {
  static const String apiBaseUrl = 'https://your-api-url.com';
  static const String appName = 'KetoPilot';
  // Add your configuration here
}
```

## 🧪 Testing

### Run Unit Tests
```bash
flutter test
```

### Run Integration Tests
```bash
flutter test integration_test/
```

### Run Widget Tests
```bash
flutter test test/widget_test.dart
```

### Coverage Report
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 🔨 Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS App Store
```bash
flutter build ios --release
```

### Web Application
```bash
flutter build web --release
```

### Desktop Applications
```bash
# macOS
flutter build macos --release

# Windows
flutter build windows --release

# Linux
flutter build linux --release
```

## 📋 Development Guidelines

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart)
- Use `flutter analyze` to check for issues
- Format code with `dart format .`

### Git Workflow
1. Create feature branches from `main`
2. Make atomic commits with clear messages
3. Submit pull requests for review
4. Ensure all tests pass before merging

### Adding New Features
1. Create feature directory in `lib/features/`
2. Follow clean architecture pattern
3. Add unit tests for business logic
4. Update documentation

## 🛡 Dependencies

### Core Dependencies
- **flutter**: SDK framework
- **auto_route**: Navigation and routing
- **freezed**: Immutable data classes
- **json_annotation**: JSON serialization
- **riverpod**: State management
- **fl_chart**: Data visualization

### Development Dependencies
- **build_runner**: Code generation
- **auto_route_generator**: Route generation
- **freezed**: Code generation for data classes
- **json_serializable**: JSON serialization generation

See `pubspec.yaml` for complete dependency list.

## 🐛 Troubleshooting

### Common Issues

**Build Errors**:
```bash
# Clean build cache
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**iOS Build Issues**:
```bash
# Update iOS pods
cd ios && pod install --repo-update
```

**Android Build Issues**:
```bash
# Clean Android build
cd android && ./gradlew clean
```

**Code Generation Issues**:
```bash
# Regenerate all generated files
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```
