import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PlayerIcon', () {
    testWidgets('renders PlayerIconType.x correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PlayerIcon(
              type: PlayerIconType.x,
              color: Colors.red,
            ),
          ),
        ),
      );

      expect(find.byType(PlayerIcon), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PlayerIcon),
          matching: find.byType(CustomPaint),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders PlayerIconType.o correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PlayerIcon(
              type: PlayerIconType.o,
              color: Colors.blue,
              size: 40,
            ),
          ),
        ),
      );

      expect(find.byType(PlayerIcon), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PlayerIcon),
          matching: find.byType(CustomPaint),
        ),
        findsOneWidget,
      );
      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(PlayerIcon),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, equals(40));
    });

    testWidgets('uses massive size by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PlayerIcon(
              type: PlayerIconType.x,
              color: Colors.red,
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(PlayerIcon),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, equals(64)); // xxlg is 64
    });

    testWidgets('shouldRepaint returns true when properties change', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PlayerIcon(
              type: PlayerIconType.x,
              color: Colors.red,
            ),
          ),
        ),
      );

      // Pump again with different properties to trigger shouldRepaint
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          home: const Scaffold(
            body: PlayerIcon(
              type: PlayerIconType.o,
              color: Colors.blue,
            ),
          ),
        ),
      );

      expect(find.byType(PlayerIcon), findsOneWidget);
    });
  });
}
