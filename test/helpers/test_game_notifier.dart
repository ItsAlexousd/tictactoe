import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class TestGameNotifier extends GameNotifier {
  TestGameNotifier(this.initialState);

  final GameState initialState;

  @override
  GameState build() {
    return initialState;
  }

  @override
  Future<void> playMove(int index) async {
    // Empty for tests unless needed
  }
}

class TestGameNotifierWithCallback extends GameNotifier {
  TestGameNotifierWithCallback(this.initialState, this.onPlayMove);

  final GameState initialState;
  final void Function(int index) onPlayMove;

  @override
  GameState build() {
    return initialState;
  }

  @override
  Future<void> playMove(int index) async {
    onPlayMove(index);
  }
}
