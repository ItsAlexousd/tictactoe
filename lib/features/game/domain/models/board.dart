import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';

part 'board.freezed.dart';

@freezed
abstract class Board with _$Board {
  const factory Board({
    @Default([null, null, null, null, null, null, null, null, null])
    List<Player?> cells,
  }) = _Board;

  const Board._();

  Board copyWithMove(int index, Player player) {
    final newCells = List<Player?>.from(cells);
    newCells[index] = player;
    return copyWith(cells: newCells);
  }

  bool get isFull => !cells.contains(null);

  bool isEmpty(int index) => cells[index] == null;

  List<int> get availableMoves {
    final moves = <int>[];
    for (var i = 0; i < cells.length; i++) {
      if (cells[i] == null) moves.add(i);
    }
    return moves;
  }
}
