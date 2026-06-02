import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRadius', () {
    test('has correct default values', () {
      const radius = AppRadius();
      expect(radius.xs, equals(4));
      expect(radius.sm, equals(8));
      expect(radius.md, equals(12));
      expect(radius.lg, equals(16));
      expect(radius.xlg, equals(24));
      expect(radius.xxlg, equals(32));
      expect(radius.circle, equals(1000));
    });

    test('copyWith returns a new instance with updated values', () {
      const radius = AppRadius();
      final updated = radius.copyWith(
        xs: 10,
        sm: 20,
        md: 30,
        lg: 40,
        xlg: 50,
        xxlg: 60,
        circle: 70,
      );

      expect(updated.xs, equals(10));
      expect(updated.sm, equals(20));
      expect(updated.md, equals(30));
      expect(updated.lg, equals(40));
      expect(updated.xlg, equals(50));
      expect(updated.xxlg, equals(60));
      expect(updated.circle, equals(70));
    });

    test('copyWith returns identical instance when no values are provided', () {
      const radius = AppRadius();
      final updated = radius.copyWith();

      expect(updated.xs, equals(radius.xs));
      expect(updated.sm, equals(radius.sm));
      expect(updated.md, equals(radius.md));
      expect(updated.lg, equals(radius.lg));
      expect(updated.xlg, equals(radius.xlg));
      expect(updated.xxlg, equals(radius.xxlg));
      expect(updated.circle, equals(radius.circle));
    });

    test('lerp returns this when other is not AppRadius', () {
      const radius = AppRadius();
      final lerped = radius.lerp(null, 0.5);

      expect(lerped, equals(radius));
    });

    test('lerp interpolates between two AppRadius instances', () {
      const radius1 = AppRadius(
        xs: 0,
        sm: 10,
        md: 20,
        lg: 30,
        xlg: 40,
        xxlg: 50,
        circle: 60,
      );
      const radius2 = AppRadius(
        xs: 10,
        sm: 20,
        md: 30,
        lg: 40,
        xlg: 50,
        xxlg: 60,
        circle: 70,
      );

      final lerped = radius1.lerp(radius2, 0.5);

      expect(lerped.xs, equals(5));
      expect(lerped.sm, equals(15));
      expect(lerped.md, equals(25));
      expect(lerped.lg, equals(35));
      expect(lerped.xlg, equals(45));
      expect(lerped.xxlg, equals(55));
      expect(lerped.circle, equals(65));
    });
  });
}
