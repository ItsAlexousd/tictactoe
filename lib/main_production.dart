import 'package:tictactoe/app/app.dart';
import 'package:tictactoe/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
