import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/view/game_page.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_grid.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_status_header.dart';

import '../../../../helpers/pump_app.dart';
import '../../../../helpers/test_game_notifier.dart';

void main() {
  group('GamePage', () {
    testWidgets('renders game page correctly', (tester) async {
      await tester.pumpApp(
        const GamePage(),
      );

      expect(find.byType(GameStatusHeader), findsOneWidget);
      expect(find.byType(BoardGrid), findsOneWidget);
    });

    testWidgets('refresh button resets the game', (tester) async {
      final notifier = TestGameNotifierWithCallback(
        const GameState(),
        (_) {},
      );

      await tester.pumpApp(
        const GamePage(),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );

      // Tap the refresh button in the AppBar
      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pumpAndSettle();

      // After reset, state should be ongoing with empty board
      expect(notifier.state.status, const GameStatus.ongoing());
      expect(notifier.state.board, const Board());
    });
  });
}
