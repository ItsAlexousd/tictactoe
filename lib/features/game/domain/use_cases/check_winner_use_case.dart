import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';

class CheckWinnerUseCase {
  static const List<List<int>> _winningCombinations = [
    [0, 1, 2], // Row 1
    [3, 4, 5], // Row 2
    [6, 7, 8], // Row 3
    [0, 3, 6], // Col 1
    [1, 4, 7], // Col 2
    [2, 5, 8], // Col 3
    [0, 4, 8], // Diag 1
    [2, 4, 6], // Diag 2
  ];

  GameStatus execute(Board board) {
    for (final combination in _winningCombinations) {
      final a = board.cells[combination[0]];
      final b = board.cells[combination[1]];
      final c = board.cells[combination[2]];

      if (a != null && a == b && a == c) {
        return GameStatus.winner(winner: a, winningLine: combination);
      }
    }

    if (board.isFull) {
      return const GameStatus.draw();
    }

    return const GameStatus.ongoing();
  }
}
