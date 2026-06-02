import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_result_listener.dart';

import '../../../../helpers/pump_app.dart';
import '../../../../helpers/test_game_notifier.dart';

void main() {
  group('GameResultListener', () {
    testWidgets('renders nothing when ongoing', (tester) async {
      await tester.pumpApp(
        const GameResultListener(),
      );

      expect(find.byType(AnimatedSwitcher), findsOneWidget);
    });

    testWidgets('renders overlay when draw', (tester) async {
      final notifier = TestGameNotifier(
        const GameState(status: GameStatus.draw()),
      );

      await tester.pumpApp(
        const GameResultListener(),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsWidgets); // Contains draw text
    });

    testWidgets('replay button calls resetGame', (tester) async {
      final notifier = TestGameNotifier(
        const GameState(status: GameStatus.draw()),
      );

      await tester.pumpApp(
        const GameResultListener(),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byType(GradientButton));
      await tester.pumpAndSettle();

      expect(notifier.state.status, const GameStatus.ongoing());
    });
  });
}
