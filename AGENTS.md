# AGENTS.md - Coding Agent Guidelines for Mealo

This document provides comprehensive guidelines for AI coding agents working on the Mealo Flutter project. It covers architecture decisions, coding patterns, conventions, and project-specific knowledge essential for maintaining consistency and quality.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture & Patterns](#architecture--patterns)
3. [Code Style & Conventions](#code-style--conventions)
4. [Database & Persistence](#database--persistence)
5. [State Management](#state-management)
6. [Navigation](#navigation)
7. [UI Components & Theming](#ui-components--theming)
8. [File Organization](#file-organization)
9. [Development Workflow](#development-workflow)
10. [Common Patterns](#common-patterns)
11. [Performance Considerations](#performance-considerations)
12. [Testing Guidelines](#testing-guidelines)
13. [Troubleshooting](#troubleshooting)

## Project Overview

Mealo is a meal planning and randomization app built with Flutter. The core concept is to gamify meal selection by allowing users to store meals with detailed metadata and then randomly select meals based on various filters.

### Core Features
- **Meal Management**: CRUD operations for meals with images, ingredients, tags, and ratings
- **Smart Randomization**: Filter-based meal selection with history tracking
- **Image Management**: Local file storage with automatic cleanup
- **Rating System**: Multi-dimensional ratings (effort, time, tastiness)
- **Tag System**: Flexible categorization for meals and ingredients

## Architecture & Patterns

### Overall Architecture
The app follows a **layered architecture** with clear separation of concerns:

```
Presentation Layer (Views + Widgets)
     ↓
State Management Layer (Riverpod Providers)
     ↓
Business Logic Layer (Models + Services)
     ↓
Data Layer (Isar Database + File System)
```

### Key Architectural Decisions

1. **Local-First Approach**: All data is stored locally using Isar database
2. **Reactive State Management**: Riverpod for declarative, reactive state handling
3. **Code Generation**: Heavy use of build_runner for boilerplate reduction
4. **Component-Based UI**: Reusable components from custom `base_components` library

### Design Patterns Used

- **Repository Pattern**: Persistence layer abstraction
- **Provider Pattern**: State management with Riverpod
- **Builder Pattern**: UI construction with conditional rendering
- **Observer Pattern**: Reactive state updates

## Code Style & Conventions

### Naming Conventions

#### Files and Directories
```dart
// Files: snake_case
meal_detail_view.dart
add_edit_meal_sheet.dart

// Directories: snake_case
views/meals/widgets/add_edit_meal_sheet/

// Classes: PascalCase
class MealDetailsView extends ConsumerWidget {}

// Variables and functions: camelCase
final ScrollController controller;
void navigateToMeal() {}

// Constants: camelCase with descriptive prefixes
static const String subPathForImages = 'meal-images';
```

#### Widget Naming Conventions

**CRITICAL**: Widget naming follows a strict folder-structure-based hierarchy:

1. **Top-level View widgets**: Always end with `View`
```dart
// Main view files in views/[feature]/[feature].dart
class HomeView extends ConsumerWidget {}         // views/home/home.dart
class MealsView extends ConsumerWidget {}        // views/meals/meals.dart  
class SettingsView extends ConsumerWidget {}     // views/settings/settings.dart
class MealDetailsView extends ConsumerWidget {}  // views/meals/details/details.dart
class RandomizeMealView extends ConsumerWidget {} // views/randomize_meal/randomize_meal.dart
```

2. **Feature-specific widgets**: Named based on folder structure and purpose
```dart
// Widgets in views/[feature]/widgets/ - descriptive names without "View" suffix
class PrevAteMeals extends StatelessWidget {}    // views/home/widgets/prev_ate_meals.dart
class MealGrid extends StatelessWidget {}        // widgets/shared/meal_grid.dart

// Nested feature widgets - context-specific names
class ImagePreview extends StatefulWidget {}     // views/meals/widgets/.../image_preview.dart
class TagsBlock extends StatelessWidget {}       // views/randomize_meal/tags_block.dart
class IngredientsBlock extends StatelessWidget {} // views/randomize_meal/ingredients_block.dart
```

3. **Sub-feature widgets**: Follow parent context naming
```dart
// Nested in feature subfolders - inherit context from parent
class RatingsOverview extends ConsumerWidget {}  // views/settings/ratings_tags_management/widgets/ratings_overview.dart
class MealRandomizer extends ConsumerStatefulWidget {} // views/randomize_meal/meal_randomizer/meal_randomizer.dart
class AmountTextField extends StatefulWidget {}  // views/meals/widgets/add_edit_meal_sheet/ingredients_step_long/amount_text_field.dart
```

**Naming Rules:**
- **Main views**: `[Feature]View` (e.g., `HomeView`, `MealsView`)
- **Sub-views**: `[Feature][Context]View` (e.g., `MealDetailsView`)
- **Feature widgets**: `[Purpose][Type]` (e.g., `TagsBlock`, `IngredientsBlock`)
- **Shared widgets**: `[Function][Type]` (e.g., `ImagePreview`, `MealGrid`)
- **Utility widgets**: Descriptive names based on function (e.g., `AmountTextField`)

**File-to-Class Mapping:**
```dart
// File: views/meals/details/details.dart
class MealDetailsView extends ConsumerWidget {} ✅

// File: views/randomize_meal/tags_block.dart  
class TagsBlock extends StatelessWidget {} ✅

// File: views/home/widgets/prev_ate_meals.dart
class PrevAteMeals extends StatelessWidget {} ✅
```

#### Model Conventions
```dart
// Base models inherit from BaseModel or CommonModel
abstract class BaseModel {
  @id String uuid = const Uuid().v4();
  @utc DateTime created = DateTime.now();
  @utc DateTime updated = DateUtils.zero;
}

abstract class CommonModel extends BaseModel {
  late String name; // All common models have names
}
```

#### Provider Conventions
```dart
// Provider classes end with the model name
@riverpod
class Meals extends _$Meals with Persistence<Meal> {
  @override
  FutureOr<List<Meal>> build() async => this.init();
}

// Usage
final asyncMeals = ref.watch(mealsProvider);
```

### Code Organization Patterns

#### Widget Structure
```dart
// Preferred widget structure
class ExampleView extends ConsumerWidget {
  // 1. Required parameters first
  final String requiredParam;
  
  // 2. Optional parameters
  final VoidCallback? onTap;
  
  // 3. Constructor
  const ExampleView({
    super.key,
    required this.requiredParam,
    this.onTap,
  });

  // 4. Build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Local state watches
    final asyncData = ref.watch(dataProvider);
    
    return BaseAsyncValueBuilder(
      asyncValue: asyncData,
      data: (data) => _buildContent(context, data),
    );
  }
  
  // 5. Private helper methods
  Widget _buildContent(BuildContext context, Data data) {
    return Container(); // Implementation
  }
}
```

### Import Organization
```dart
// 1. Dart core libraries
import 'dart:io';

// 2. Flutter libraries
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// 3. Third-party packages (alphabetical)
import 'package:base_components/base_components.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

// 4. Internal imports (relative paths, alphabetical)
import '../../models/meal/meal.dart';
import '../../utils/router.dart';
import '../widgets/meal_grid.dart';
```

## Database & Persistence

### Isar Database Schema

The app uses **Isar** as the local database with the following key concepts:

#### Model Hierarchy
```dart
BaseModel (uuid, created, updated)
├── CommonModel (name)
│   ├── Meal
│   ├── Ingredient  
│   ├── Tag
│   ├── Rating
│   └── Unit
├── Settings (singleton)
└── RandomizedRun (tracking)
```

#### Key Database Patterns

1. **Persistence Mixin Usage**:
```dart
@riverpod
class Meals extends _$Meals with Persistence<Meal> {
  @override
  FutureOr<List<Meal>> build() async => this.init();
}
```

2. **Transaction Handling**:
```dart
// Always use PersistenceUtils.transaction for mutations
PersistenceUtils.transaction(
  PersistenceOperation.insertUpdate,
  [meal],
);
```

3. **Date Handling**:
```dart
// Use DateUtils.zero for new models
DateTime updated = DateUtils.zero; // Indicates new model

// Automatic timestamp management in transactions
model.updated = model.updated == DateUtils.zero 
  ? model.created 
  : DateTime.now();
```

#### Image Storage Strategy
- Images stored in device documents directory
- Folder: `{documents}/meal-images/`
- Files named with UUID v4
- Automatic cleanup of orphaned images on app startup

```dart
// Image path construction
Directory baseDir = await getApplicationDocumentsDirectory();
String imagePath = '${baseDir.path}/${Meal.subPathForImages}/$imageUuid';
```

### Data Validation Rules

1. **Required Fields**: All models must have valid UUIDs and timestamps
2. **Relationships**: Use UUID references, not direct object references
3. **Cleanup**: Implement proper cascade deletion for relationships

## State Management

### Riverpod Patterns

#### Provider Types Used
1. **FutureProvider**: For async data loading
2. **AsyncNotifierProvider**: For mutable async state
3. **NotifierProvider**: For synchronous state management

#### Common Provider Patterns

```dart
// Data providers (read-only collections)
@riverpod
class Meals extends _$Meals with Persistence<Meal> {
  @override
  FutureOr<List<Meal>> build() async => this.init();
  
  // Mutations trigger automatic state updates
  void addMeal(Meal meal) {
    // Database transaction
    PersistenceUtils.transaction(PersistenceOperation.insertUpdate, [meal]);
    // State automatically updates via persistence mixin
  }
}

// Stateful providers (complex state management)
@riverpod
class CurrentRandomizedRun extends _$CurrentRandomizedRun {
  @override
  RandomizedRun? build() => null;

  void start({required RandomizeConfig config}) async {
    // Set loading state
    state = const AsyncLoading();
    // Perform async operation
    final result = await _randomizeMeal(config);
    state = AsyncData(result);
  }
}
```

#### State Watching Best Practices

```dart
// ✅ Good: Specific value selection
final darkMode = ref.watch(
  settingsSingletonProvider.select((value) => value.valueOrNull?.darkMode)
) ?? true;

// ✅ Good: Use AsyncValueBuilder for complex async state
BaseAsyncValueBuilder(
  asyncValue: ref.watch(mealsProvider),
  data: (meals) => MealGrid(meals: meals),
)

// ❌ Avoid: Watching entire complex objects when only need subset
final settings = ref.watch(settingsSingletonProvider); // Too broad
```

### State Update Patterns

```dart
// For simple updates
ref.read(providerName.notifier).updateField(newValue);

// For complex state changes with multiple steps
ref.read(providerName.notifier).performComplexOperation(
  param1: value1,
  param2: value2,
);
```

## Navigation

### Beamer Router Configuration

The app uses **Beamer** for navigation with a tab-based structure:

#### Route Structure
```
/home (Tab 1)
├── /home/meals/:uuid
├── /home/randomize-meal
└── /home/randomize-meal/:uuid

/meals (Tab 2)
└── /meals/:uuid

/settings (Tab 3)
└── /settings/ratings-tags-management
```

#### Navigation Patterns

```dart
// Always use RouterUtils.goTo for navigation
RouterUtils.goTo(context, MealDetailRoute(meal.uuid));

// For replacement navigation
RouterUtils.goTo(context, NewRoute(), replace: true);

// Route definitions follow pattern:
class MealDetailRoute extends MealsRoute {
  static String blueprint = 'meals/:uuid';
  
  MealDetailRoute(String uuid) : super() {
    this.path += '/$uuid';
  }
}
```

#### Tab Management
- Each tab has its own `BeamerDelegate`
- Scroll controllers maintained per tab
- Tab state preserved during navigation

### Navigation Best Practices

1. **Always use RouterUtils.goTo()** - Never use Navigator directly
2. **Define route blueprints** - Use static blueprint strings for consistency
3. **Parameter validation** - Always validate route parameters
4. **Deep linking support** - All routes should handle direct access

## UI Components & Theming

### Component Library Structure

The app heavily uses the **base_components** library for consistency:

```dart
// Core components used throughout the app
BaseScaffold(
  appBarProperties: AppBarProperties(title: Text('Title')),
  children: [...],
)

BaseCard(
  title: 'Section Title',
  child: ContentWidget(),
)

BaseAsyncValueBuilder(
  asyncValue: asyncData,
  data: (data) => DataWidget(data),
  loading: () => TextShimmer(),
)
```

### Theming System

#### Theme Configuration
```dart
// Theme utilities in utils/theme.dart
class ThemeUtils {
  static ThemeData baseLight = /* Material 3 light theme */;
  static ThemeData baseDark = /* Material 3 dark theme */;
}

// Dynamic theme switching
bool darkMode = ref.watch(
  settingsSingletonProvider.select((value) => value.valueOrNull?.darkMode)
) ?? true;
```

#### Design System Access
```dart
// Consistent spacing and sizing
SizedBox(height: DesignSystem.spacing.x24)
BorderRadius.circular(DesignSystem.border.radius12)
Container(height: DesignSystem.size.x92)

// Animation durations
DesignSystem.animation.defaultDurationMS250
```

### UI Patterns

#### Async Data Handling
```dart
// Standard pattern for async data
BaseAsyncValueBuilder(
  asyncValue: ref.watch(dataProvider),
  loading: () => const TextShimmer(),
  error: (error, stackTrace) => ErrorWidget(error),
  data: (data) => DataDisplayWidget(data),
)
```

#### Modal Presentations
```dart
// Bottom sheets
ModalUtils.showExpandedModalBottomSheet(
  context,
  const AddEditMealSheet(),
  popOnClose: false,
  onClose: () => _handleSheetClose(context, ref),
);

// Dialogs
ModalUtils.showBaseDialog(
  context,
  MealoBaseConfirmationDialog(
    title: 'Confirm Action',
    body: 'Are you sure?',
    onYes: (_) => performAction(),
  ),
);
```

#### Image Handling
```dart
// For meal images, always use file-based approach
File imageFile = File('${baseDir.path}/${Meal.subPathForImages}/$uuid');
Image.file(imageFile)

// For asset images
Image.asset('assets/images/app-icon.jpeg')
```

## File Organization

### Directory Structure Guidelines

```
lib/
├── models/              # Data layer
│   ├── [entity]/       # Per-entity organization
│   │   ├── entity.dart # Model definition
│   │   └── entity.g.dart # Generated code
│   ├── embeddings/     # Embedded objects
│   └── settings/       # App configuration models
├── views/              # Presentation layer
│   ├── [feature]/      # Feature-based organization
│   │   ├── [feature].dart
│   │   └── widgets/    # Feature-specific widgets
├── widgets/            # Shared UI components
│   ├── shared/         # App-wide reusable widgets
│   └── themed/         # Theme-specific components
├── stores/             # State management
│   ├── shared/         # Global state
│   └── views/          # View-specific state
├── utils/              # Helper functions
└── types/              # Type definitions
    ├── dto/            # Data transfer objects
    ├── classes/        # Utility classes
    └── extensions/     # Dart extensions
```

### File Naming Conventions

1. **Models**: `entity_name.dart` (e.g., `meal.dart`)
2. **Views**: `view_name.dart` (e.g., `home.dart`)
3. **Widgets**: `widget_purpose.dart` (e.g., `meal_grid.dart`)
4. **Providers**: Same as model name (e.g., `meal.dart` contains `MealsProvider`)

### Import Path Guidelines

```dart
// Use relative imports for internal files
import '../../models/meal/meal.dart';       // ✅ Good
import 'package:mealo/models/meal/meal.dart'; // ❌ Avoid

// Package imports for external dependencies
import 'package:flutter/material.dart';      // ✅ Good
import 'package:base_components/base_components.dart'; // ✅ Good
```

## Development Workflow

### Code Generation Workflow

1. **After modifying models**:
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **During development** (watching for changes):
   ```bash
   flutter packages pub run build_runner watch
   ```

3. **Generated files to expect**:
   - `*.g.dart` - Riverpod providers, Isar schemas
   - `*.freezed.dart` - Immutable classes

### Adding New Features

#### 1. Database Changes
```dart
// 1. Add/modify model in models/
@collection
class NewModel extends CommonModel {
  // fields
}

// 2. Add schema to PersistenceUtils._schemas
static final List<IsarGeneratedSchema> _schemas = [
  // existing schemas...
  NewModelSchema,
];

// 3. Regenerate code
```

#### 2. State Management
```dart
// 1. Create provider in models/[entity]/[entity].dart
@riverpod
class NewModels extends _$NewModels with Persistence<NewModel> {
  @override
  FutureOr<List<NewModel>> build() async => this.init();
}

// 2. Use in widgets
final asyncModels = ref.watch(newModelsProvider);
```

#### 3. UI Implementation
```dart
// 1. Create view in views/[feature]/
class NewFeatureView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(/* ... */);
  }
}

// 2. Add route to router.dart
class NewFeatureRoute extends BaseRoute {
  static String blueprint = '/new-feature';
  NewFeatureRoute() : super('/new-feature');
}

// 3. Add to router configuration
```

## Common Patterns

### Meal Management Patterns

#### Creating/Editing Meals
```dart
// Always validate required fields
if (meal.name.isEmpty) {
  // Show error
  return;
}

// Handle image persistence
for (String imageUuid in meal.imagesUuids) {
  // Ensure image file exists
  File imageFile = File('${imagePath}/$imageUuid');
  if (!imageFile.existsSync()) {
    // Handle missing image
  }
}

// Use transactions for data integrity
PersistenceUtils.transaction(PersistenceOperation.insertUpdate, [meal]);
```

#### Filtering Patterns
```dart
// Complex filtering with multiple criteria
List<Meal> filterMeals(List<Meal> meals, FilterCriteria criteria) {
  return meals.where((meal) {
    return _hasRequiredTags(meal, criteria.includedTags) &&
           _excludesForbiddenTags(meal, criteria.excludedTags) &&
           _meetsRatingThreshold(meal, criteria.minRatings) &&
           _notRecentlyEaten(meal, criteria.daysSinceLastEaten);
  }).toList();
}
```

### Image Management Patterns

```dart
// Image cleanup pattern
Future<void> cleanupOrphanedImages() async {
  Directory imagesDir = Directory('${basePath}/${Meal.subPathForImages}');
  List<FileSystemEntity> imageFiles = imagesDir.listSync();
  List<Meal> allMeals = await ref.read(mealsProvider.future);
  
  Set<String> referencedImages = {};
  for (Meal meal in allMeals) {
    referencedImages.addAll(meal.imagesUuids);
    if (meal.thumbnailUuid != null) {
      referencedImages.add(meal.thumbnailUuid!);
    }
  }
  
  for (FileSystemEntity file in imageFiles) {
    String fileName = file.path.split('/').last;
    if (!referencedImages.contains(fileName)) {
      await file.delete(); // Cleanup orphaned image
    }
  }
}
```

### Randomization Patterns

```dart
// Weighted randomization with history awareness
Meal selectRandomMeal(List<Meal> eligibleMeals, List<RandomizedRun> history) {
  // Apply weights based on how recently meals were eaten
  Map<Meal, double> weights = {};
  
  for (Meal meal in eligibleMeals) {
    DateTime? lastEaten = _getLastEatenDate(meal, history);
    double weight = _calculateWeight(lastEaten);
    weights[meal] = weight;
  }
  
  return _weightedRandomSelection(weights);
}
```

## Performance Considerations

### Database Performance

1. **Isar Queries**: Use specific queries instead of loading all data
```dart
// ✅ Good: Specific query
List<Meal> recentMeals = await PersistenceUtils.where<Meal>()
  .createdGreaterThan(DateTime.now().subtract(Duration(days: 30)))
  .findAll();

// ❌ Avoid: Loading all then filtering
List<Meal> allMeals = await ref.read(mealsProvider.future);
List<Meal> recent = allMeals.where(/* condition */).toList();
```

2. **Image Loading**: Lazy load images and implement caching
3. **State Updates**: Use selective watching to minimize rebuilds

### Memory Management

1. **Dispose Controllers**: Always dispose scroll controllers and other resources
2. **Image Memory**: Use `FileImage` with caching for meal images
3. **Provider Lifecycle**: Leverage Riverpod's automatic disposal

### UI Performance

1. **ListView.builder**: Use for dynamic lists
2. **Selective Rebuilds**: Use `select()` for provider watching
3. **Image Optimization**: Resize images before storage

## Testing Guidelines

### Unit Testing

Focus on testing:
1. **Business Logic**: Filtering algorithms, randomization logic
2. **Data Models**: Validation and transformation methods
3. **Utilities**: Helper functions and extensions

### Widget Testing

Test key user interactions:
1. **Meal Creation Flow**: Adding meals with all required fields
2. **Randomization Process**: Filter application and result selection
3. **Navigation**: Route handling and parameter passing

### Integration Testing

Test complete workflows:
1. **End-to-End Meal Management**: Create → Edit → Delete
2. **Randomization with Filters**: Complex filtering scenarios
3. **Image Management**: Upload → Display → Cleanup

## Troubleshooting

### Common Issues

#### Code Generation Problems
```bash
# Clean and regenerate
flutter clean
flutter pub get
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

#### Database Issues
```dart
// Reset database during development
PersistenceUtils.purge(); // Use with caution - deletes all data
```

#### State Management Issues
```dart
// Force provider refresh
ref.invalidate(providerName);

// Check provider state
final state = ref.read(providerName);
print('Current state: ${state}');
```

#### Image Loading Problems
```dart
// Verify image file exists
File imageFile = File(imagePath);
if (!imageFile.existsSync()) {
  // Handle missing image gracefully
  return PlaceholderWidget();
}
```

### Development Tips

1. **Use Flutter Inspector**: Essential for debugging widget trees
2. **Riverpod Inspector**: Monitor state changes in development
3. **Isar Inspector**: Examine database contents during development
4. **Hot Reload Friendly**: Structure widgets to support hot reload
5. **Error Boundaries**: Implement proper error handling in AsyncValueBuilder

### Performance Debugging

1. **Profile Mode**: Use `flutter run --profile` for performance testing
2. **Memory Usage**: Monitor with Flutter DevTools
3. **Database Performance**: Use Isar's built-in performance monitoring
4. **Image Memory**: Track image loading and caching behavior

---

## Dependency Constraints & Known Issues

### Isar Database Constraints (Critical)

**Current Version**: 4.0.0-dev.14  
**Status**: Constrains many other dependencies due to analyzer version requirements

The Isar database package (4.0.0-dev.14) enforces strict constraints on other dependencies:
- **Analyzer**: Must be <7.0.0 (conflicts with newer Riverpod versions)
- **Source Gen**: Must be ^1.4.0 (conflicts with newer Freezed versions)
- **Build Tools**: Limited to older versions

### Affected Dependencies

Due to Isar constraints, the following packages are locked to older versions:
- `riverpod_generator`: ^2.4.0 (instead of ^4.0.3)
- `flutter_riverpod`: ^2.5.1 (instead of ^3.3.1)
- `riverpod_annotation`: ^2.4.0 (instead of ^4.0.2)
- `freezed`: ^2.4.7 (instead of ^3.2.5)
- `riverpod_lint`: Disabled due to analyzer conflicts

### Successfully Updated Dependencies

The following packages were updated to newer versions:
- `uuid`: ^4.5.3 (from ^3.0.7)
- `flex_color_scheme`: ^8.4.0 (from ^8.2.0)
- `flutter_native_splash`: ^2.4.7 (from ^2.4.6)
- `cupertino_icons`: ^1.0.8 (from ^1.0.2)
- `crypto`: ^3.0.6 (from ^3.0.2)
- `dio`: ^5.9.0 (from ^5.1.1)

### Platform-Specific Issues

**iOS Build Warnings**: The current camera plugin version (0.10.6) generates warnings with newer Xcode versions due to deprecated APIs. This is a known compatibility issue that doesn't prevent functionality but may require attention in future updates.

### Upgrade Path Recommendations

1. **Monitor Isar Updates**: Watch for stable Isar 4.x releases that might relax analyzer constraints
2. **Alternative Databases**: Consider migration to more actively maintained alternatives if Isar development stalls
3. **Gradual Updates**: Update individual packages when Isar constraints are resolved
4. **Build Testing**: Always test builds on target platforms after dependency changes

### Development Workflow Impact

- **Code Generation**: Works correctly with current versions
- **Static Analysis**: Some deprecation warnings are expected
- **Hot Reload**: Functions normally
- **Production Builds**: May require platform-specific adjustments

## Final Notes for Agents

When working on this project:

1. **Always run code generation** after model changes
2. **Follow the established patterns** - don't introduce new architectural patterns without discussion
3. **Test on both platforms** - iOS and Android have different behaviors
4. **Preserve data integrity** - be careful with database migrations and image management
5. **Maintain UI consistency** - use the base_components library
6. **Consider performance** - especially with image handling and large datasets
7. **Respect dependency constraints** - do not attempt to upgrade packages that conflict with Isar
8. **Document new patterns** - update this file when adding new architectural decisions

The codebase is designed for maintainability and scalability. Stick to the established patterns, and the code will remain clean and consistent.