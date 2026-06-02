import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/domain/use_cases/check_winner_use_case.dart';

void main() {
  group('CheckWinnerUseCase', () {
    late CheckWinnerUseCase useCase;

    setUp(() {
      useCase = CheckWinnerUseCase();
    });

    test('returns ongoing for empty board', () {
      const board = Board();
      final status = useCase.execute(board);

      expect(status, equals(const GameStatus.ongoing()));
    });

    test('returns winner X for top row win', () {
      final board = const Board()
          .copyWithMove(0, Player.x)
          .copyWithMove(1, Player.x)
          .copyWithMove(2, Player.x);

      final status = useCase.execute(board);

      expect(
        status,
        equals(
          const GameStatus.winner(winner: Player.x, winningLine: [0, 1, 2]),
        ),
      );
    });

    test('returns winner O for diagonal win', () {
      final board = const Board()
          .copyWithMove(2, Player.o)
          .copyWithMove(4, Player.o)
          .copyWithMove(6, Player.o);

      final status = useCase.execute(board);

      expect(
        status,
        equals(
          const GameStatus.winner(winner: Player.o, winningLine: [2, 4, 6]),
        ),
      );
    });

    test('returns draw for full board with no winner', () {
      // X O X
      // X O O
      // O X X
      final cells = [
        Player.x,
        Player.o,
        Player.x,
        Player.x,
        Player.o,
        Player.o,
        Player.o,
        Player.x,
        Player.x,
      ];
      final board = Board(cells: cells);
      final status = useCase.execute(board);

      expect(status, equals(const GameStatus.draw()));
    });
  });
}
