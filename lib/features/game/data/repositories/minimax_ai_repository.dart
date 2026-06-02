import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/domain/repositories/ai_repository.dart';
import 'package:tictactoe/features/game/domain/use_cases/check_winner_use_case.dart';

class MinimaxAiRepository implements AiRepository {
  const MinimaxAiRepository({
    required this.checkWinnerUseCase,
  });

  final CheckWinnerUseCase checkWinnerUseCase;

  @override
  Future<int> calculateNextMove({
    required Board board,
    required Player aiPlayer,
  }) async {
    // Add a slight delay to simulate "thinking" and improve UX.
    await Future<void>.delayed(const Duration(milliseconds: 500));

    var bestScore = -double.infinity;
    var bestMove = -1;

    for (final move in board.availableMoves) {
      final newBoard = board.copyWithMove(move, aiPlayer);
      final score = _minimax(
        board: newBoard,
        depth: 0,
        isMaximizing: false,
        aiPlayer: aiPlayer,
      );

      if (score > bestScore) {
        bestScore = score;
        bestMove = move;
      }
    }

    return bestMove;
  }

  double _minimax({
    required Board board,
    required int depth,
    required bool isMaximizing,
    required Player aiPlayer,
  }) {
    final status = checkWinnerUseCase.execute(board);

    final terminalScore = status.mapOrNull(
      winner: (w) => w.winner == aiPlayer ? 10.0 - depth : -10.0 + depth,
      draw: (_) => 0.0,
    );

    if (terminalScore != null) return terminalScore;

    final humanPlayer = aiPlayer.opposite;

    if (isMaximizing) {
      var bestScore = -double.infinity;
      for (final move in board.availableMoves) {
        final newBoard = board.copyWithMove(move, aiPlayer);
        final score = _minimax(
          board: newBoard,
          depth: depth + 1,
          isMaximizing: false,
          aiPlayer: aiPlayer,
        );
        if (score > bestScore) {
          bestScore = score;
        }
      }
      return bestScore;
    } else {
      var bestScore = double.infinity;
      for (final move in board.availableMoves) {
        final newBoard = board.copyWithMove(move, humanPlayer);
        final score = _minimax(
          board: newBoard,
          depth: depth + 1,
          isMaximizing: true,
          aiPlayer: aiPlayer,
        );
        if (score < bestScore) {
          bestScore = score;
        }
      }
      return bestScore;
    }
  }
}
