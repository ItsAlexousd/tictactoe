import 'dart:ui';
import 'package:flutter/material.dart';

/// {@template app_size}
/// Size scale tokens for consistent styling throughout the app.
/// {@endtemplate}
class AppSize extends ThemeExtension<AppSize> {
  /// {@macro app_size}
  const AppSize({
    this.xs = 8,
    this.sm = 16,
    this.md = 24,
    this.lg = 32,
    this.xlg = 48,
    this.xxlg = 64,
    this.avatarLarge = 80,
    this.iconMassive = 100,
  });

  /// Extra small size: 8px.
  final double xs;

  /// Small size: 16px.
  final double sm;

  /// Medium size: 24px.
  final double md;

  /// Large size: 32px.
  final double lg;

  /// Extra large size: 48px.
  final double xlg;

  /// Extra extra large size: 64px.
  final double xxlg;

  /// Large avatar size: 80px.
  final double avatarLarge;

  /// Massive icon size: 100px.
  final double iconMassive;

  @override
  AppSize copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xlg,
    double? xxlg,
    double? avatarLarge,
    double? iconMassive,
  }) {
    return AppSize(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xlg: xlg ?? this.xlg,
      xxlg: xxlg ?? this.xxlg,
      avatarLarge: avatarLarge ?? this.avatarLarge,
      iconMassive: iconMassive ?? this.iconMassive,
    );
  }

  @override
  AppSize lerp(AppSize? other, double t) {
    if (other is! AppSize) return this;
    return AppSize(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xlg: lerpDouble(xlg, other.xlg, t)!,
      xxlg: lerpDouble(xxlg, other.xxlg, t)!,
      avatarLarge: lerpDouble(avatarLarge, other.avatarLarge, t)!,
      iconMassive: lerpDouble(iconMassive, other.iconMassive, t)!,
    );
  }
}
