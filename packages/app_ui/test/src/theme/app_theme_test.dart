import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    testWidgets('light theme has correct extensions', (tester) async {
      final theme = AppTheme.light;

      expect(theme.extension<AppColors>(), isNotNull);
      expect(theme.extension<AppSpacing>(), isNotNull);
      expect(theme.extension<AppRadius>(), isNotNull);
      expect(theme.extension<AppSize>(), isNotNull);
    });

    testWidgets('light theme uses modern typography', (tester) async {
      final theme = AppTheme.light;
      expect(theme.textTheme.displayLarge?.fontFamily, isNotNull);
    });
  });
}
