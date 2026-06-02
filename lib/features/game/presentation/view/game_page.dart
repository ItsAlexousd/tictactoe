import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_grid.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_result_listener.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_status_header.dart';
import 'package:tictactoe/l10n/l10n.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        backgroundColor: appColors.transparent,
        elevation: 0,
        actions: [
          Consumer(
            builder: (context, ref, _) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  ref.read(gameProvider.notifier).resetGame();
                },
                tooltip: context.l10n.restartGame,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: context.appSpacing.xlg),
                const GameStatusHeader(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(context.appSpacing.md),
                    child: const Center(
                      child: BoardGrid(),
                    ),
                  ),
                ),
                SizedBox(height: context.appSpacing.xlg),
              ],
            ),
            const GameResultListener(),
          ],
        ),
      ),
    );
  }
}
