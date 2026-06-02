import 'package:app_ui/app_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/app_router.dart';
import 'package:tictactoe/l10n/l10n.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appSpacing = context.appSpacing;
    final appColors = context.appColors;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _TitleText(),
              SizedBox(height: appSpacing.xxlg * 2),
              GradientButton(
                onPressed: () => context.goNamed(AppRoute.game.name),
                text: context.l10n.playVsCpu,
                colors: appColors.primaryGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = context.appColors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _build3DText('TIC', appColors.playerO, theme),
        _build3DText('TAC', appColors.playerX, theme),
        _build3DText('TOE', appColors.playerO, theme),
      ],
    );
  }

  Widget _build3DText(String text, Color color, ThemeData theme) {
    return Stack(
      children: [
        // Shadow/3D effect
        Transform.translate(
          offset: const Offset(4, 6),
          child: Text(
            text,
            style: theme.textTheme.displayLarge?.copyWith(
              color: theme.shadowColor,
            ),
          ),
        ),
        // Foreground
        Text(
          text,
          style: theme.textTheme.displayLarge?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
