import 'package:app_ui/app_ui.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template app_theme}
/// Composes [ThemeData] with [ColorScheme.fromSeed] and custom
/// [ThemeExtension]s for light and dark variants.
/// {@endtemplate}
class AppTheme {
  static ThemeData get light {
    const appColors = AppColors(
      success: Color(0xFF2ECA6A),
      onSuccess: Color(0xFFFFFFFF),
      warning: Color(0xFFFF9800),
      onWarning: Color(0xFFFFFFFF),
      info: Color(0xFF00BCD4),
      onInfo: Color(0xFFFFFFFF),
      playerX: Color(0xFFFF4B4B),
      playerO: Color(0xFFFFC107),
      boardBackground: Color(0xFF382766),
      transparent: Colors.transparent,
      white: Colors.white,
      primaryGradient: [
        Color(0xFFE91E63),
        Color(0xFFC2185B),
      ],
      secondaryGradient: [
        Color(0xFFFF9800),
        Color(0xFFF57C00),
      ],
    );

    const seedColor = Color(0xFF281B54);

    final baseTextTheme = GoogleFonts.fredokaTextTheme();

    return ThemeData(
      scaffoldBackgroundColor: seedColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      textTheme: baseTextTheme
          .copyWith(
            displayLarge: baseTextTheme.displayLarge?.copyWith(
              fontSize: 80,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
              color: Colors.white,
            ),
            titleLarge: baseTextTheme.titleLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
          .apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      extensions: const [
        appColors,
        AppSpacing(),
        AppRadius(),
        AppSize(),
      ],
    );
  }
}
