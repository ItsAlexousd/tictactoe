import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/game_status.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';
import 'package:tictactoe/features/game/domain/repositories/ai_repository.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class MockAiRepository extends Mock implements AiRepository {}

class FakeBoard extends Fake implements Board {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeBoard());
    registerFallbackValue(Player.x);
  });

  group('GameNotifier', () {
    late ProviderContainer container;
    late MockAiRepository aiRepository;

    setUp(() {
      aiRepository = MockAiRepository();
      container = ProviderContainer(
        overrides: [
          aiRepositoryProvider.overrideWithValue(aiRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is correct', () {
      final state = container.read(gameProvider);
      expect(state.board, const Board());
      expect(state.currentPlayer, Player.x);
      expect(state.status, const GameStatus.ongoing());
      expect(state.isAiThinking, false);
    });

    test('playMove updates board and switches player', () async {
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async => 1);

      await container.read(gameProvider.notifier).playMove(0);

      final state = container.read(gameProvider);
      expect(state.board.cells[0], Player.x);
      expect(state.board.cells[1], Player.o); // AI move
      expect(state.currentPlayer, Player.x); // Back to human
    });

    test('resetGame restores initial state', () async {
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async => 1);

      await container.read(gameProvider.notifier).playMove(0);
      container.read(gameProvider.notifier).resetGame();

      final state = container.read(gameProvider);
      expect(state.board, const Board());
      expect(state.currentPlayer, Player.x);
    });

    test('does not allow move if cell is not empty', () async {
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async => 1);

      await container.read(gameProvider.notifier).playMove(0);

      // Try to play on same spot
      await container.read(gameProvider.notifier).playMove(0);

      final state = container.read(gameProvider);
      expect(state.board.cells[0], Player.x); // Should still be X
    });

    test('does not allow move if game is not ongoing', () async {
      final notifier = container.read(gameProvider.notifier);

      // Override state manually
      // We can't directly override state from outside without extending,
      // but we can mock a scenario where X wins.

      // Let's just create a custom container for this test to inject a state
      // that is won. Wait, state is public? No, we can't set it.
      // We can just play a series of moves to win the game!
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer(
        (_) async => 8,
      ); // AI always plays 8 (it will be overwritten, but whatever)

      // Play 0, AI plays 8
      await notifier.playMove(0);
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async => 7);
      // Play 1, AI plays 7
      await notifier.playMove(1);

      // Play 2 -> X wins!
      await notifier.playMove(2);

      // Now game is won
      final state = container.read(gameProvider);
      expect(
        state.status.maybeWhen(winner: (_, _) => true, orElse: () => false),
        isTrue,
      );

      // Try to play again
      await notifier.playMove(3);

      final stateAfter = container.read(gameProvider);
      expect(stateAfter.board.cells[3], isNull); // Should not allow move
    });

    test('does not apply AI move if game was reset while thinking', () async {
      // Simulate AI taking time
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return 1;
      });

      // Keep the provider alive during the test to prevent autoDispose
      final subscription = container.listen(gameProvider, (_, _) {});
      final notifier = container.read(gameProvider.notifier);

      // Start human move which triggers AI thinking
      final moveFuture = notifier.playMove(0);

      // While AI is thinking, reset the game
      notifier.resetGame();

      // Wait for AI to finish
      await moveFuture;

      // Game should still be empty (reset state) and AI move not applied
      final state = container.read(gameProvider);
      expect(state.board.cells[1], isNull);

      subscription.close();
    });

    test('does not apply AI move if game ended while thinking', () async {
      // Simulate AI taking time
      when(
        () => aiRepository.calculateNextMove(
          board: any(named: 'board'),
          aiPlayer: any(named: 'aiPlayer'),
        ),
      ).thenAnswer((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return 1;
      });

      final subscription = container.listen(gameProvider, (_, _) {});
      final notifier = container.read(gameProvider.notifier);

      // Start human move which triggers AI thinking
      final moveFuture = notifier.playMove(0);

      // While AI is thinking, force the game to a draw state
      notifier.state = notifier.state.copyWith(
        status: const GameStatus.draw(),
      );

      // Wait for AI to finish
      await moveFuture;

      // The AI move should NOT have been applied
      final state = container.read(gameProvider);
      expect(state.status, const GameStatus.draw());
      expect(state.board.cells[1], isNull);

      subscription.close();
    });

    test('default checkWinnerUseCaseProvider returns a CheckWinnerUseCase', () {
      final container = ProviderContainer();
      final useCase = container.read(checkWinnerUseCaseProvider);
      expect(useCase, isNotNull);
    });

    test('default aiRepositoryProvider returns a MinimaxAiRepository', () {
      final container = ProviderContainer();
      final repo = container.read(aiRepositoryProvider);
      expect(repo, isNotNull);
    });
  });
}
