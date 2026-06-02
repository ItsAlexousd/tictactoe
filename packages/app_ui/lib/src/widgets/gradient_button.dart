import 'package:app_ui/app_ui.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.onPressed,
    required this.text,
    required this.colors,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final appRadius = context.appRadius;
    final appSpacing = context.appSpacing;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(appRadius.xxlg),
        boxShadow: [
          BoxShadow(
            color: colors.last.withValues(alpha: 0.5),
            offset: const Offset(0, 4),
            blurRadius: appRadius.sm,
          ),
        ],
      ),
      child: Material(
        color: appColors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(appRadius.xxlg),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appSpacing.lg,
              vertical: appSpacing.md,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
