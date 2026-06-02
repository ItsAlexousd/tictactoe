import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/widgets/player_card.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('PlayerCard', () {
    testWidgets('renders Player.x correctly', (tester) async {
      await tester.pumpApp(
        const PlayerCard(
          player: Player.x,
          name: 'P1',
          isTurn: true,
          isWinner: false,
          isLoser: false,
        ),
      );

      expect(find.text('P1'), findsOneWidget);
    });

    testWidgets('renders winner correctly', (tester) async {
      await tester.pumpApp(
        const PlayerCard(
          player: Player.x,
          name: 'P1',
          isTurn: false,
          isWinner: true,
          isLoser: false,
        ),
      );

      expect(find.byType(Text), findsWidgets);
    });

    testWidgets('renders loser correctly', (tester) async {
      await tester.pumpApp(
        const PlayerCard(
          player: Player.x,
          name: 'P1',
          isTurn: false,
          isWinner: false,
          isLoser: true,
        ),
      );
    });

    testWidgets('renders Player.o correctly', (tester) async {
      await tester.pumpApp(
        const PlayerCard(
          player: Player.o,
          name: 'P2',
          isTurn: true,
          isWinner: false,
          isLoser: false,
        ),
      );
    });
  });
}
