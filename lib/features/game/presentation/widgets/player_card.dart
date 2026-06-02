import 'package:app_ui/app_ui.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/l10n/l10n.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    required this.player,
    required this.name,
    required this.isTurn,
    required this.isWinner,
    required this.isLoser,
    super.key,
  });

  final Player player;
  final String name;
  final bool isTurn;
  final bool isWinner;
  final bool isLoser;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final theme = Theme.of(context);
    final appSpacing = context.appSpacing;
    final appRadius = context.appRadius;
    final appSize = context.appSize;

    final borderColor = isWinner
        ? appColors.success
        : isTurn
        ? (player == Player.x ? appColors.playerX : appColors.playerO)
        : appColors.transparent;

    final playerColor = player == Player.x
        ? appColors.playerX
        : appColors.playerO;
    final iconType = player == Player.x ? PlayerIconType.x : PlayerIconType.o;

    var statusText = '';

    if (isWinner) {
      statusText = context.l10n.winner;
    } else if (isLoser) {
      statusText = context.l10n.loser;
    } else if (isTurn && player == Player.x) {
      statusText = context.l10n.yourTurn;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: appSpacing.lg,
            vertical: appSpacing.md,
          ),
          decoration: BoxDecoration(
            color: appColors.boardBackground,
            borderRadius: BorderRadius.circular(appRadius.xlg),
            border: Border.all(
              color: borderColor,
              width: appSpacing.xxs,
            ),
            boxShadow: isTurn || isWinner
                ? [
                    BoxShadow(
                      color: borderColor.withValues(alpha: 0.3),
                      blurRadius: appRadius.lg,
                      spreadRadius: appRadius.xs,
                    ),
                  ]
                : [],
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: appSize.lg,
                backgroundColor: theme.scaffoldBackgroundColor,
                child: Icon(
                  player == Player.x
                      ? Icons.person_rounded
                      : Icons.smart_toy_rounded,
                  color: playerColor,
                  size: appSize.lg,
                ),
              ),
              SizedBox(height: appSpacing.sm),
              Text(
                name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appColors.white,
                ),
              ),
              SizedBox(height: appSpacing.xs),
              PlayerIcon(type: iconType, color: playerColor, size: appSize.md),
            ],
          ),
        ),
        SizedBox(height: appSpacing.md),
        AnimatedOpacity(
          opacity: statusText.isNotEmpty ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            statusText,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isWinner
                  ? appColors.success
                  : (isTurn
                        ? appColors.white
                        : appColors.white.withValues(alpha: 0.54)),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
