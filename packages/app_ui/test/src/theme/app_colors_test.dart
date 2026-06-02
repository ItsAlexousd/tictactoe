import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    const colors = AppColors(
      success: Color(0xFF000000),
      onSuccess: Color(0xFF000000),
      warning: Color(0xFF000000),
      onWarning: Color(0xFF000000),
      info: Color(0xFF000000),
      onInfo: Color(0xFF000000),
      playerX: Color(0xFF000000),
      playerO: Color(0xFF000000),
      boardBackground: Color(0xFF000000),
      transparent: Color(0x00000000),
      white: Color(0xFFFFFFFF),
      primaryGradient: [Color(0xFF000000), Color(0xFF000000)],
      secondaryGradient: [Color(0xFF000000), Color(0xFF000000)],
    );

    test('supports value equality', () {
      expect(
        colors,
        equals(
          const AppColors(
            success: Color(0xFF000000),
            onSuccess: Color(0xFF000000),
            warning: Color(0xFF000000),
            onWarning: Color(0xFF000000),
            info: Color(0xFF000000),
            onInfo: Color(0xFF000000),
            playerX: Color(0xFF000000),
            playerO: Color(0xFF000000),
            boardBackground: Color(0xFF000000),
            transparent: Color(0x00000000),
            white: Color(0xFFFFFFFF),
            primaryGradient: [Color(0xFF000000), Color(0xFF000000)],
            secondaryGradient: [Color(0xFF000000), Color(0xFF000000)],
          ),
        ),
      );
    });

    test('lerp interpolates between two AppColors', () {
      const other = AppColors(
        success: Color(0x00000000),
        onSuccess: Color(0x00000000),
        warning: Color(0x00000000),
        onWarning: Color(0x00000000),
        info: Color(0x00000000),
        onInfo: Color(0x00000000),
        playerX: Color(0x00000000),
        playerO: Color(0x00000000),
        boardBackground: Color(0x00000000),
        transparent: Color(0x00000000),
        white: Color(0x00000000),
        primaryGradient: [Color(0x00000000), Color(0x00000000)],
        secondaryGradient: [Color(0x00000000), Color(0x00000000)],
      );

      final result = colors.lerp(other, 0.5);

      expect(result.success, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.onSuccess, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.warning, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.onWarning, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.info, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.onInfo, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.playerX, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(result.playerO, equals(const Color.fromRGBO(0, 0, 0, 0.5)));
      expect(
        result.boardBackground,
        equals(const Color.fromRGBO(0, 0, 0, 0.5)),
      );
      expect(result.transparent, equals(const Color(0x00000000)));
      expect(
        result.white,
        equals(
          Color.lerp(const Color(0xFFFFFFFF), const Color(0x00000000), 0.5),
        ),
      );
    });
    test('lerp returns this when other is not AppColors', () {
      final result = colors.lerp(null, 0.5);
      expect(result, equals(colors));
    });

    test(
      'copyWith returns identical values when no properties are provided',
      () {
        final result = colors.copyWith();
        expect(result.success, equals(colors.success));
        expect(result.onSuccess, equals(colors.onSuccess));
        expect(result.warning, equals(colors.warning));
        expect(result.onWarning, equals(colors.onWarning));
        expect(result.info, equals(colors.info));
        expect(result.onInfo, equals(colors.onInfo));
        expect(result.playerX, equals(colors.playerX));
        expect(result.playerO, equals(colors.playerO));
        expect(result.boardBackground, equals(colors.boardBackground));
        expect(result.transparent, equals(colors.transparent));
        expect(result.white, equals(colors.white));
        expect(result.primaryGradient, equals(colors.primaryGradient));
        expect(result.secondaryGradient, equals(colors.secondaryGradient));
      },
    );

    test('copyWith returns new instance with updated values', () {
      final result = colors.copyWith(
        success: const Color(0xFF111111),
        onSuccess: const Color(0xFF111111),
        warning: const Color(0xFF111111),
        onWarning: const Color(0xFF111111),
        info: const Color(0xFF111111),
        onInfo: const Color(0xFF111111),
        playerX: const Color(0xFF111111),
        playerO: const Color(0xFF111111),
        boardBackground: const Color(0xFF111111),
        transparent: const Color(0xFF111111),
        white: const Color(0xFF111111),
        primaryGradient: [const Color(0xFF111111)],
        secondaryGradient: [const Color(0xFF111111)],
      );

      expect(result.success, equals(const Color(0xFF111111)));
      expect(result.onSuccess, equals(const Color(0xFF111111)));
      expect(result.warning, equals(const Color(0xFF111111)));
      expect(result.onWarning, equals(const Color(0xFF111111)));
      expect(result.info, equals(const Color(0xFF111111)));
      expect(result.onInfo, equals(const Color(0xFF111111)));
      expect(result.playerX, equals(const Color(0xFF111111)));
      expect(result.playerO, equals(const Color(0xFF111111)));
      expect(result.boardBackground, equals(const Color(0xFF111111)));
      expect(result.transparent, equals(const Color(0xFF111111)));
      expect(result.white, equals(const Color(0xFF111111)));
      expect(result.primaryGradient, equals([const Color(0xFF111111)]));
      expect(result.secondaryGradient, equals([const Color(0xFF111111)]));
    });
  });
}
