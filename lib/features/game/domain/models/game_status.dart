import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/models/player.dart';

part 'game_status.freezed.dart';

@freezed
sealed class GameStatus with _$GameStatus {
  const factory GameStatus.ongoing() = _Ongoing;
  const factory GameStatus.draw() = _Draw;
  const factory GameStatus.winner({
    required Player winner,
    required List<int> winningLine,
  }) = _Winner;
}
