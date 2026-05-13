# Mealo 🍽️

A Flutter application that gamifies meal planning by helping you store, organize, and randomly select your next meal. Say goodbye to the eternal "what should we eat?" problem!

## About

Mealo is designed to solve one of life's daily dilemmas: deciding what to eat. The app allows you to:

- **Store meals** with detailed information (ingredients, tags, ratings, photos)
- **Organize** your meal collection with custom tags and ratings
- **Randomize** meal selection with advanced filtering
- **Track** meal history and eating patterns
- **Filter** by ingredients, tags, ratings, and time since last eaten

## Features

### 🥘 Meal Management
- Create and edit meals with detailed information
- Add multiple photos and thumbnails
- Ingredient management with quantities and units
- Custom tagging system for categorization
- Multi-dimensional rating system (effort, time, tastiness, etc.)

### 🎲 Smart Randomization
- Advanced filtering system for meal selection
- Include/exclude specific tags and ingredients
- Filter by minimum rating requirements
- Time-based filtering (avoid recently eaten meals)
- Visual meal shuffling animation

### 📱 Modern UI/UX
- Material Design 3 with dark/light theme support
- Smooth animations and transitions
- Tab-based navigation (Home, Meals, Settings)
- Responsive grid layouts
- Native splash screen

### 📊 Data Management
- Local storage with Isar database
- Automatic image cleanup
- Settings persistence
- Meal history tracking

## Tech Stack

### Core Framework
- **Flutter SDK** (>=3.0.0 <4.0.0) - Cross-platform UI framework
- **Dart** - Programming language

### State Management & Architecture
- **Riverpod** (flutter_riverpod: ^2.6.1) - Reactive state management
- **Riverpod Annotations** (riverpod_annotation: ^2.6.1) - Code generation for providers
- **Riverpod Generator** (riverpod_generator: ^2.6.1) - Build-time code generation

### Data & Persistence
- **Isar** (4.0.0-dev.14) - High-performance NoSQL database
- **Shared Preferences** (^2.0.17) - Simple key-value storage
- **Freezed** (^2.3.2) - Immutable data classes with code generation

### Navigation & Routing
- **Beamer** (^1.5.3) - Declarative navigation with Navigator 2.0

### UI & Theming
- **Flex Color Scheme** (^8.2.0) - Advanced theming system
- **FluentUI System Icons** (^1.1.190) - Microsoft's icon pack
- **Auto Size Text** (^3.0.0) - Responsive text sizing
- **Flutter Animate** (^4.0.0) - Animation library
- **Flutter Staggered Animations** (^1.1.1) - List animations
- **Sliver Tools** (^0.2.8) - Enhanced sliver widgets

### Media & File Handling
- **Camera** (^0.10.3) - Camera access and photo capture
- **File Picker** (^10.2.2) - File selection
- **Path Provider** (^2.0.14) - File system paths

### Utilities & Extensions
- **UUID** (^3.0.7) - Unique identifier generation
- **Collection** (^1.17.0) - Utility functions for collections
- **Crypto** (^3.0.2) - Cryptographic functions
- **Reorderables** (^0.6.0) - Drag-and-drop reordering

### Development & Quality
- **Custom Lint** + **Riverpod Lint** - Code quality enforcement
- **Build Runner** - Code generation
- **Flutter Launcher Icons** (^0.14.4) - App icon generation
- **Flutter Native Splash** (^2.4.6) - Native splash screen

### Custom Components
- **Base Components** - Custom UI component library from GitHub

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- iOS development: Xcode and iOS simulator
- Android development: Android Studio and Android emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mealo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   # For debug mode
   flutter run
   
   # For release mode
   flutter run --release
   ```

### Platform-Specific Setup

#### iOS
- Requires iOS 11.0 or later
- Camera and photo library permissions are automatically handled

#### Android
- Minimum SDK version: 21 (Android 5.0)
- Target SDK version: Latest Flutter default
- Camera and storage permissions are automatically handled

### Development

#### Code Generation
The app uses code generation for:
- Riverpod providers (`*.g.dart`)
- Freezed classes (`*.freezed.dart`)
- Isar schemas (`*.g.dart`)

Run code generation:
```bash
flutter packages pub run build_runner build
# or for watching changes
flutter packages pub run build_runner watch
```

#### Database Schema Updates
When modifying Isar models, regenerate schemas:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Project Structure

```
lib/
├── models/           # Data models and database entities
│   ├── meal/        # Meal model and provider
│   ├── ingredient/  # Ingredient management
│   ├── rating/      # Rating system
│   ├── tag/         # Tagging system
│   └── settings/    # App settings
├── views/           # UI screens
│   ├── home/        # Home dashboard
│   ├── meals/       # Meal management screens
│   ├── randomize_meal/ # Meal randomization
│   └── settings/    # Settings screens
├── widgets/         # Reusable UI components
├── stores/          # Riverpod state management
├── utils/           # Utility functions
│   ├── router.dart  # Navigation configuration
│   ├── theme.dart   # Theming utilities
│   └── persistence.dart # Database utilities
└── types/           # Type definitions and DTOs
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
