import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class BoardCell extends ConsumerWidget {
  const BoardCell({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(
      gameProvider.select((state) => state.board.cells[index]),
    );
    final isWinningCell = ref.watch(
      gameProvider.select((state) {
        return state.status.maybeWhen(
          winner: (winner, line) => line.contains(index),
          orElse: () => false,
        );
      }),
    );

    final appColors = context.appColors;
    final appSpacing = context.appSpacing;
    final appRadius = context.appRadius;

    final playerColor = player == Player.x
        ? appColors.playerX
        : appColors.playerO;
    final iconType = player == Player.x ? PlayerIconType.x : PlayerIconType.o;

    return GestureDetector(
      onTap: () => ref.read(gameProvider.notifier).playMove(index),
      child: Container(
        decoration: BoxDecoration(
          color: appColors.boardBackground,
          borderRadius: BorderRadius.circular(appRadius.lg),
          border: isWinningCell
              ? Border.all(color: appColors.success, width: appSpacing.xxs)
              : null,
          boxShadow: isWinningCell
              ? [
                  BoxShadow(
                    color: appColors.success.withValues(alpha: 0.5),
                    blurRadius: appRadius.md,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: player != null
                ? PlayerIcon(
                    key: ValueKey<Player?>(player),
                    type: iconType,
                    color: playerColor,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
