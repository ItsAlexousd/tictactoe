# Tic Tac Toe

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

A production-ready Tic Tac Toe game.

---

## 🎯 Technical Highlights

This project was built with a strong focus on scalability, testability, and separation of concerns, anticipating the requirements of a large-scale enterprise application.

### Architecture (Clean Architecture)
The application strictly follows Clean Architecture principles, divided into three main layers:

- **Domain (`lib/features/game/domain/`)**: The pure core of the application. It contains the business entities (`Board`, `Player`, `GameStatus`), the interfaces (`AiRepository`), and business logic rules (`CheckWinnerUseCase`). It has **zero dependencies** on Flutter or third-party libraries.
- **Data (`lib/features/game/data/`)**: Contains the concrete implementations of the domain interfaces. Here, the `MinimaxAiRepository` implements the AI algorithm, separated from the UI and core domain.
- **Presentation (`lib/features/game/presentation/`)**: The UI and State Management layer. It consumes the Domain layer through Riverpod providers.

### UI Toolkit Extraction (`packages/app_ui`)
To simulate a monorepo/enterprise environment, the design system has been extracted into a standalone package: `packages/app_ui`.
It provides a centralized source of truth for:
- Typography, Colors, Spacing, and Radius (`AppTheme`, `AppColors`, etc.)
- Reusable, atomic widgets (`GradientButton`, `PlayerIcon`)
This ensures visual consistency and prevents the main application from being cluttered with low-level UI components.

### State Management (Riverpod + Freezed)
State management is handled by **Riverpod** with code generation (`@riverpod`).
The UI state is modeled using **Freezed** (`GameState`), ensuring absolute immutability and providing exhaustive pattern matching for safe UI rebuilds.

### AI Implementation (Minimax Algorithm)
The AI is powered by the **Minimax algorithm**, a recursive algorithm that evaluates all possible future moves to ensure the AI never loses. It is encapsulated within the Data layer and heavily relies on the `CheckWinnerUseCase` to evaluate terminal states.

### 100% Test Coverage 🧪
The application is fully tested, achieving **100% test coverage** on both the main app and the `app_ui` package.
- **Unit Tests**: Verifying business logic, state transitions in `GameNotifier`, and the Minimax algorithm. Mocks are generated using `mocktail`.
- **Widget Tests**: Ensuring the UI renders correctly in all states (ongoing, draw, winner) and responds to user interactions.

---

## 🚀 Getting Started

This project contains 3 flavors:
- `development`
- `staging`
- `production`

To run the desired flavor, use the launch configuration in VSCode/Android Studio or the following commands:

```sh
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

## 🧪 Running Tests & Coverage

To run the test suite and verify the **100% coverage**, use the following commands.
*(Note: We filter out generated files (`*.g.dart`) and external packages to get the true coverage of our codebase).*

```sh
# 1. Run tests with coverage
flutter test --coverage

# 2. Filter out generated files and packages
lcov --remove coverage/lcov.info 'packages/*' '*.g.dart' -o coverage/lcov.info

# 3. Generate HTML Report
genhtml coverage/lcov.info -o coverage/

# 4. Open the report
open coverage/index.html
```

You can repeat the same process inside the `packages/app_ui` directory to verify its coverage.

---

## 🌐 Localization

This project uses standard Flutter localization (`flutter_localizations`).
Translations are located in `lib/l10n/arb/`.

[coverage_badge]: coverage_badge.svg
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
