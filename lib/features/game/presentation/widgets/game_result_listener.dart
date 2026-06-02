import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_result_overlay.dart';

class GameResultListener extends ConsumerWidget {
  const GameResultListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(gameProvider.select((state) => state.status));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: status.maybeWhen(
        ongoing: () => const SizedBox.shrink(),
        orElse: () => GameResultOverlay(
          status: status,
          onReplay: () {
            ref.read(gameProvider.notifier).resetGame();
          },
        ),
      ),
    );
  }
}
