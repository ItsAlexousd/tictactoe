import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BuildContextExtensions', () {
    testWidgets('appColors returns AppColors from theme', (tester) async {
      late AppColors colors;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              colors = context.appColors;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(colors, isNotNull);
      expect(colors, isA<AppColors>());
    });

    testWidgets('appSpacing returns AppSpacing from theme', (tester) async {
      late AppSpacing spacing;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              spacing = context.appSpacing;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(spacing, isNotNull);
      expect(spacing, isA<AppSpacing>());
    });

    testWidgets('appRadius returns AppRadius from theme', (tester) async {
      late AppRadius radius;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              radius = context.appRadius;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(radius, isNotNull);
      expect(radius, isA<AppRadius>());
    });

    testWidgets('appSize returns AppSize from theme', (tester) async {
      late AppSize size;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Builder(
            builder: (context) {
              size = context.appSize;
              return const SizedBox();
            },
          ),
        ),
      );

      expect(size, isNotNull);
      expect(size, isA<AppSize>());
    });
  });
}
