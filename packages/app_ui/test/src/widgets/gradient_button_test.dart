import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GradientButton', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: GradientButton(
              onPressed: () {},
              text: 'Test',
              colors: const [Colors.red, Colors.blue],
            ),
          ),
        ),
      );

      expect(find.byType(GradientButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: GradientButton(
              onPressed: () => pressed = true,
              text: 'Test',
              colors: const [Colors.red, Colors.blue],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GradientButton));
      expect(pressed, isTrue);
    });

    testWidgets('has correct gradient colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: Scaffold(
            body: GradientButton(
              onPressed: () {},
              text: 'Test',
              colors: const [Colors.red, Colors.blue],
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(GradientButton),
              matching: find.byType(Container),
            )
            .first,
      );

      final decoration = container.decoration! as BoxDecoration;
      final gradient = decoration.gradient! as LinearGradient;

      expect(gradient.colors, equals([Colors.red, Colors.blue]));
    });
  });
}
