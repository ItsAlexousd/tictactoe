enum Player {
  x,
  o;

  Player get opposite => this == Player.x ? Player.o : Player.x;
}
