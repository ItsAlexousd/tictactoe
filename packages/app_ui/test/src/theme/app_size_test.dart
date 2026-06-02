import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppSize', () {
    test('has correct default values', () {
      const size = AppSize();
      expect(size.xs, equals(8));
      expect(size.sm, equals(16));
      expect(size.md, equals(24));
      expect(size.lg, equals(32));
      expect(size.xlg, equals(48));
      expect(size.xxlg, equals(64));
      expect(size.avatarLarge, equals(80));
      expect(size.iconMassive, equals(100));
    });

    test('copyWith returns a new instance with updated values', () {
      const size = AppSize();
      final updated = size.copyWith(
        xs: 10,
        sm: 20,
        md: 30,
        lg: 40,
        xlg: 50,
        xxlg: 60,
        avatarLarge: 70,
        iconMassive: 80,
      );

      expect(updated.xs, equals(10));
      expect(updated.sm, equals(20));
      expect(updated.md, equals(30));
      expect(updated.lg, equals(40));
      expect(updated.xlg, equals(50));
      expect(updated.xxlg, equals(60));
      expect(updated.avatarLarge, equals(70));
      expect(updated.iconMassive, equals(80));
    });

    test('copyWith returns identical instance when no values are provided', () {
      const size = AppSize();
      final updated = size.copyWith();

      expect(updated.xs, equals(size.xs));
      expect(updated.sm, equals(size.sm));
      expect(updated.md, equals(size.md));
      expect(updated.lg, equals(size.lg));
      expect(updated.xlg, equals(size.xlg));
      expect(updated.xxlg, equals(size.xxlg));
      expect(updated.avatarLarge, equals(size.avatarLarge));
      expect(updated.iconMassive, equals(size.iconMassive));
    });

    test('lerp returns this when other is not AppSize', () {
      const size = AppSize();
      final lerped = size.lerp(null, 0.5);

      expect(lerped, equals(size));
    });

    test('lerp interpolates between two AppSize instances', () {
      const size1 = AppSize(
        xs: 0,
        sm: 10,
        md: 20,
        lg: 30,
        xlg: 40,
        xxlg: 50,
        avatarLarge: 60,
        iconMassive: 70,
      );
      const size2 = AppSize(
        xs: 10,
        sm: 20,
        md: 30,
        lg: 40,
        xlg: 50,
        xxlg: 60,
        avatarLarge: 70,
        iconMassive: 80,
      );

      final lerped = size1.lerp(size2, 0.5);

      expect(lerped.xs, equals(5));
      expect(lerped.sm, equals(15));
      expect(lerped.md, equals(25));
      expect(lerped.lg, equals(35));
      expect(lerped.xlg, equals(45));
      expect(lerped.xxlg, equals(55));
      expect(lerped.avatarLarge, equals(65));
      expect(lerped.iconMassive, equals(75));
    });
  });
}
