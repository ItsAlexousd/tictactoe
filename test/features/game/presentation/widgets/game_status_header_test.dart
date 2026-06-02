import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_status_header.dart';
import 'package:tictactoe/features/game/presentation/widgets/player_card.dart';

import '../../../../helpers/pump_app.dart';
import '../../../../helpers/test_game_notifier.dart';

void main() {
  group('GameStatusHeader', () {
    testWidgets('renders PlayerCards', (tester) async {
      await tester.pumpApp(
        const GameStatusHeader(),
      );

      expect(find.byType(PlayerCard), findsNWidgets(2));
    });

    testWidgets('renders PlayerCards with winner', (tester) async {
      final notifier = TestGameNotifier(
        const GameState(
          status: GameStatus.winner(
            winner: Player.x,
            winningLine: [0, 1, 2],
          ),
        ),
      );

      await tester.pumpApp(
        const GameStatusHeader(),
        overrides: [
          gameProvider.overrideWith(() => notifier),
        ],
      );

      expect(find.byType(PlayerCard), findsNWidgets(2));
    });
  });
}
