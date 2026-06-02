import 'package:app_ui/app_ui.dart';

/// {@template app_theme}
/// Composes [ThemeData] with [ColorScheme.fromSeed] and custom
/// [ThemeExtension]s for light and dark variants.
/// {@endtemplate}
class AppTheme {
  /// The light [ThemeData].
  static ThemeData get light {
    const appColors = AppColors(
      success: Color(0xFF16A34A),
      onSuccess: Color(0xFFFFFFFF),
      warning: Color(0xFFCA8A04),
      onWarning: Color(0xFFFFFFFF),
      info: Color(0xFF2563EB),
      onInfo: Color(0xFFFFFFFF),
    );

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
      extensions: const [appColors, AppSpacing()],
    );
  }
}
