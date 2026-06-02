import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/data/repositories/minimax_ai_repository.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/domain/use_cases/check_winner_use_case.dart';

void main() {
  group('MinimaxAiRepository', () {
    late MinimaxAiRepository repository;
    late CheckWinnerUseCase checkWinnerUseCase;

    setUp(() {
      checkWinnerUseCase = CheckWinnerUseCase();
      repository = MinimaxAiRepository(checkWinnerUseCase: checkWinnerUseCase);
    });

    test('takes winning move immediately', () async {
      // X X .
      // O O .
      // . . .
      final cells = [
        Player.x,
        Player.x,
        null,
        Player.o,
        Player.o,
        null,
        null,
        null,
        null,
      ];
      final board = Board(cells: cells);

      final move = await repository.calculateNextMove(
        board: board,
        aiPlayer: Player.o,
      );

      // AI (O) should take cell 5 to win
      expect(move, equals(5));
    });

    test('blocks human from winning', () async {
      // X X .
      // . O .
      // . . .
      final cells = [
        Player.x,
        Player.x,
        null,
        null,
        Player.o,
        null,
        null,
        null,
        null,
      ];
      final board = Board(cells: cells);

      final move = await repository.calculateNextMove(
        board: board,
        aiPlayer: Player.o,
      );

      // AI (O) should block cell 2
      expect(move, equals(2));
    });
  });
}
