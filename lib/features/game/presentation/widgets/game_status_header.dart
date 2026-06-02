import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/player_card.dart';
import 'package:tictactoe/l10n/l10n.dart';

class GameStatusHeader extends ConsumerWidget {
  const GameStatusHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(gameProvider.select((state) => state.status));
    final currentPlayer = ref.watch(
      gameProvider.select((state) => state.currentPlayer),
    );

    final isOngoing = status.maybeWhen(
      ongoing: () => true,
      orElse: () => false,
    );
    final winner = status.maybeWhen(winner: (p, _) => p, orElse: () => null);

    final xTurn = isOngoing && currentPlayer == Player.x;
    final oTurn = isOngoing && currentPlayer == Player.o;

    final xWinner = winner == Player.x;
    final oWinner = winner == Player.o;

    final xLoser = winner == Player.o;
    final oLoser = winner == Player.x;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlayerCard(
          player: Player.x,
          name: context.l10n.human,
          isTurn: xTurn,
          isWinner: xWinner,
          isLoser: xLoser,
        ),
        PlayerCard(
          player: Player.o,
          name: context.l10n.cpu,
          isTurn: oTurn,
          isWinner: oWinner,
          isLoser: oLoser,
        ),
      ],
    );
  }
}
