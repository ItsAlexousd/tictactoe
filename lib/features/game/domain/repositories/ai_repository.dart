import 'package:tictactoe/features/game/domain/models/board.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';

// Ignore one_member_abstracts because this interface is used for
// dependency injection in Clean Architecture, allowing us to mock
// it easily in tests.
// ignore: one_member_abstracts
abstract class AiRepository {
  /// Calculates the best next move for the given [aiPlayer] on the [board].
  /// Returns the index (0-8) of the chosen cell.
  Future<int> calculateNextMove({
    required Board board,
    required Player aiPlayer,
  });
}
