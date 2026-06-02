import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_cell.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_grid.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('BoardGrid', () {
    testWidgets('renders 9 BoardCells', (tester) async {
      await tester.pumpApp(
        const BoardGrid(),
      );

      expect(find.byType(BoardCell), findsNWidgets(9));
    });

    testWidgets('uses maxWidth when height is larger', (tester) async {
      await tester.pumpApp(
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 200,
            maxHeight: 600,
          ),
          child: const BoardGrid(),
        ),
      );

      expect(find.byType(BoardCell, skipOffstage: false), findsNWidgets(9));
    });
  });
}
