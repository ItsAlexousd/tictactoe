import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/welcome/presentation/view/welcome_page.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('WelcomePage', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpApp(
        const WelcomePage(),
      );

      expect(find.byType(GradientButton), findsOneWidget);
    });
  });
}
