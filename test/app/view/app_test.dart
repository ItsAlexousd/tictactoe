import 'package:app_ui/app_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/app/app.dart';
import 'package:tictactoe/features/game/presentation/view/game_page.dart';
import 'package:tictactoe/features/welcome/presentation/view/welcome_page.dart';

void main() {
  group('App', () {
    testWidgets('renders MaterialApp and defaults to WelcomePage', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(child: App(key: UniqueKey())),
      );

      await tester.pumpAndSettle();

      expect(find.byType(WelcomePage), findsOneWidget);

      // Navigate to GamePage
      final button = find.byType(GradientButton);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(GamePage), findsOneWidget);
    });
  });
}
