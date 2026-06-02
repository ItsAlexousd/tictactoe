import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/presentation/view/game_page.dart';
import 'package:tictactoe/features/welcome/presentation/view/welcome_page.dart';

part 'app_router.g.dart';

/// All the supported routes in the app.
/// By using an enum, we route by name using this syntax:
///
/// ```dart
/// context.goNamed(AppRoute.game.name)
/// ```
enum AppRoute { welcome, game }

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.welcome.name,
        builder: (_, _) => const WelcomePage(),
      ),
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        builder: (_, _) => const GamePage(),
      ),
    ],
  );
}
