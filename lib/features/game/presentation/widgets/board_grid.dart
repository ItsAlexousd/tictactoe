import 'package:app_ui/app_ui.dart';
import 'package:tictactoe/features/game/presentation/widgets/board_cell.dart';

class BoardGrid extends StatelessWidget {
  const BoardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Make sure it's a square
        final size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        return SizedBox(
          width: size,
          height: size,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: context.appSpacing.xs,
              mainAxisSpacing: context.appSpacing.xs,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return BoardCell(index: index);
            },
          ),
        );
      },
    );
  }
}
