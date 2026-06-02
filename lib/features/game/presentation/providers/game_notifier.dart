import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/data/repositories/minimax_ai_repository.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/domain/repositories/ai_repository.dart';
import 'package:tictactoe/features/game/domain/use_cases/check_winner_use_case.dart';

part 'game_notifier.freezed.dart';
part 'game_notifier.g.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    @Default(Board()) Board board,
    @Default(Player.x) Player currentPlayer,
    @Default(GameStatus.ongoing()) GameStatus status,
    @Default(false) bool isAiThinking,
  }) = _GameState;
}

@riverpod
AiRepository aiRepository(Ref ref) {
  return MinimaxAiRepository(checkWinnerUseCase: CheckWinnerUseCase());
}

@riverpod
CheckWinnerUseCase checkWinnerUseCase(Ref ref) {
  return CheckWinnerUseCase();
}

@riverpod
class GameNotifier extends _$GameNotifier {
  @override
  GameState build() {
    return const GameState();
  }

  Future<void> playMove(int index) async {
    final isOngoing = state.status.maybeMap(
      ongoing: (_) => true,
      orElse: () => false,
    );

    // Only allow human (Player.x) to play if it's their turn and
    // AI isn't thinking
    if (state.currentPlayer != Player.x ||
        state.isAiThinking ||
        !isOngoing ||
        !state.board.isEmpty(index)) {
      return;
    }

    _applyMove(index, Player.x);

    final isStillOngoing = state.status.maybeMap(
      ongoing: (_) => true,
      orElse: () => false,
    );

    if (isStillOngoing) {
      await _playAiMove();
    }
  }

  void _applyMove(int index, Player player) {
    final newBoard = state.board.copyWithMove(index, player);
    final checkWinner = ref.read(checkWinnerUseCaseProvider);
    final newStatus = checkWinner.execute(newBoard);

    state = state.copyWith(
      board: newBoard,
      currentPlayer: player.opposite,
      status: newStatus,
    );
  }

  Future<void> _playAiMove() async {
    state = state.copyWith(isAiThinking: true);

    final aiRepository = ref.read(aiRepositoryProvider);
    final bestMove = await aiRepository.calculateNextMove(
      board: state.board,
      aiPlayer: Player.o,
    );

    // After awaiting, ensure game hasn't been reset
    final isStillOngoing = state.status.maybeMap(
      ongoing: (_) => true,
      orElse: () => false,
    );

    if (isStillOngoing && state.currentPlayer == Player.o) {
      _applyMove(bestMove, Player.o);
    }

    state = state.copyWith(isAiThinking: false);
  }

  void resetGame() {
    state = const GameState();
  }
}
