import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_result_overlay.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('GameResultOverlay', () {
    testWidgets('renders YOU WIN when X wins', (tester) async {
      await tester.pumpApp(
        GameResultOverlay(
          status: const GameStatus.winner(
            winner: Player.x,
            winningLine: [0, 1, 2],
          ),
          onReplay: () {},
        ),
      );

      expect(find.text('YOU WIN!'), findsOneWidget);
    });

    testWidgets('renders YOU LOSE when O wins', (tester) async {
      await tester.pumpApp(
        GameResultOverlay(
          status: const GameStatus.winner(
            winner: Player.o,
            winningLine: [0, 1, 2],
          ),
          onReplay: () {},
        ),
      );

      expect(find.text('YOU LOSE!'), findsOneWidget);
    });

    testWidgets('calls onReplay', (tester) async {
      var called = false;
      await tester.pumpApp(
        GameResultOverlay(
          status: const GameStatus.draw(),
          onReplay: () {
            called = true;
          },
        ),
      );

      await tester.tap(find.byType(GradientButton));
      expect(called, isTrue);
    });

    testWidgets('renders nothing when ongoing', (tester) async {
      await tester.pumpApp(
        GameResultOverlay(
          status: const GameStatus.ongoing(),
          onReplay: () {},
        ),
      );

      expect(find.byType(CircleAvatar), findsNothing);
    });
  });
}
