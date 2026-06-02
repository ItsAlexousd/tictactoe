import 'package:app_ui/app_ui.dart';

/// {@template app_colors}
/// Custom color tokens beyond Material's [ColorScheme].
/// {@endtemplate}
class AppColors extends ThemeExtension<AppColors> {
  /// {@macro app_colors}
  const AppColors({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.info,
    required this.onInfo,
    required this.playerX,
    required this.playerO,
    required this.boardBackground,
    required this.transparent,
    required this.white,
    required this.primaryGradient,
    required this.secondaryGradient,
  });

  final Color success;
  final Color onSuccess;
  final Color warning;
  final Color onWarning;
  final Color info;
  final Color onInfo;

  /// The color used for Player X symbols and highlights
  final Color playerX;

  /// The color used for Player O symbols and highlights
  final Color playerO;

  /// The color used for the game board background (glassmorphism effect base)
  final Color boardBackground;

  /// A strict transparent token.
  final Color transparent;

  /// A strict white token.
  final Color white;

  /// The primary gradient used for main actions (e.g., Pink gradient).
  final List<Color> primaryGradient;

  /// The secondary gradient used for secondary actions (e.g., Orange gradient).
  final List<Color> secondaryGradient;

  @override
  AppColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? info,
    Color? onInfo,
    Color? playerX,
    Color? playerO,
    Color? boardBackground,
    Color? transparent,
    Color? white,
    List<Color>? primaryGradient,
    List<Color>? secondaryGradient,
  }) {
    return AppColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      playerX: playerX ?? this.playerX,
      playerO: playerO ?? this.playerO,
      boardBackground: boardBackground ?? this.boardBackground,
      transparent: transparent ?? this.transparent,
      white: white ?? this.white,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      playerX: Color.lerp(playerX, other.playerX, t)!,
      playerO: Color.lerp(playerO, other.playerO, t)!,
      boardBackground: Color.lerp(boardBackground, other.boardBackground, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      white: Color.lerp(white, other.white, t)!,
      // Gradients are harder to lerp perfectly without a custom lerp
      // function for lists, but typically we can assume they match in length.
      primaryGradient: other.primaryGradient,
      secondaryGradient: other.secondaryGradient,
    );
  }
}
