import 'dart:ui';
import 'package:flutter/material.dart';

/// {@template app_radius}
/// Radius scale tokens for consistent styling throughout the app.
/// {@endtemplate}
class AppRadius extends ThemeExtension<AppRadius> {
  /// {@macro app_radius}
  const AppRadius({
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xlg = 24,
    this.xxlg = 32,
    this.circle = 1000,
  });

  /// Extra small radius: 4px.
  final double xs;

  /// Small radius: 8px.
  final double sm;

  /// Medium radius: 12px.
  final double md;

  /// Large radius: 16px.
  final double lg;

  /// Extra large radius: 24px.
  final double xlg;

  /// Extra extra large radius: 32px.
  final double xxlg;

  /// Circle radius (very large): 1000px.
  final double circle;

  @override
  AppRadius copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xlg,
    double? xxlg,
    double? circle,
  }) {
    return AppRadius(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xlg: xlg ?? this.xlg,
      xxlg: xxlg ?? this.xxlg,
      circle: circle ?? this.circle,
    );
  }

  @override
  AppRadius lerp(AppRadius? other, double t) {
    if (other is! AppRadius) return this;
    return AppRadius(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xlg: lerpDouble(xlg, other.xlg, t)!,
      xxlg: lerpDouble(xxlg, other.xxlg, t)!,
      circle: lerpDouble(circle, other.circle, t)!,
    );
  }
}
