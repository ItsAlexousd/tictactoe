import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_cell.dart';

import '../../../../helpers/pump_app.dart';
import '../../../../helpers/test_game_notifier.dart';

void main() {
  group('BoardCell', () {
    testWidgets('renders correctly empty cell', (tester) async {
      await tester.pumpApp(
        const BoardCell(index: 0),
      );

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('renders Player.x icon when cell is X', (tester) async {
      final board = const Board().copyWithMove(0, Player.x);
      final notifier = TestGameNotifier(GameState(board: board));

      await tester.pumpApp(
        const BoardCell(index: 0),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );

      expect(find.byType(PlayerIcon), findsOneWidget);
    });

    testWidgets('calls playMove when tapped', (tester) async {
      var moveIndex = -1;
      final notifier = TestGameNotifierWithCallback(
        const GameState(),
        (index) => moveIndex = index,
      );

      await tester.pumpApp(
        const BoardCell(index: 0),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(moveIndex, 0);
    });

    testWidgets('renders winning cell correctly', (tester) async {
      final board = const Board().copyWithMove(0, Player.x);
      final notifier = TestGameNotifier(
        GameState(
          board: board,
          status: const GameStatus.winner(
            winner: Player.x,
            winningLine: [0, 1, 2],
          ),
        ),
      );

      await tester.pumpApp(
        const BoardCell(index: 0),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(GestureDetector),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.border, isNotNull);
      expect(decoration.boxShadow, isNotNull);
    });
  });
}
