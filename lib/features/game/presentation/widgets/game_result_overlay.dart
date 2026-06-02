import 'package:app_ui/app_ui.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/l10n/l10n.dart';

class GameResultOverlay extends StatelessWidget {
  const GameResultOverlay({
    required this.status,
    required this.onReplay,
    super.key,
  });

  final GameStatus status;
  final VoidCallback onReplay;

  @override
  Widget build(BuildContext context) {
    return status.maybeWhen(
      winner: (winner, _) => _buildOverlay(context, winner: winner),
      draw: () => _buildOverlay(context),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildOverlay(BuildContext context, {Player? winner}) {
    final theme = Theme.of(context);
    final appColors = context.appColors;
    final appSpacing = context.appSpacing;

    final appRadius = context.appRadius;
    final appSize = context.appSize;

    String title;
    Color color;
    IconData icon;

    if (winner == Player.x) {
      title = context.l10n.youWin;
      color = appColors.success;
      icon = Icons.emoji_emotions_rounded;
    } else if (winner == Player.o) {
      title = context.l10n.youLose;
      color = theme.colorScheme.error;
      icon = Icons.mood_bad_rounded;
    } else {
      title = context.l10n.draw;
      color = appColors.warning;
      icon = Icons.sentiment_neutral_rounded;
    }

    return ColoredBox(
      color: theme.scaffoldBackgroundColor.withValues(alpha: 0.9),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: appRadius.xxlg,
                    spreadRadius: appRadius.sm,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: appSize.avatarLarge,
                backgroundColor: appColors.boardBackground,
                child: Icon(
                  icon,
                  size: appSize.iconMassive,
                  color: color,
                ),
              ),
            ),
            SizedBox(height: appSpacing.xxlg),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(
                color: appColors.white,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: appSpacing.xxlg * 2),
            GradientButton(
              onPressed: onReplay,
              text: context.l10n.playAgain,
              colors: appColors.secondaryGradient,
            ),
          ],
        ),
      ),
    );
  }
}
