import 'package:app_ui/app_ui.dart';

enum PlayerIconType { x, o }

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({
    required this.type,
    required this.color,
    this.size,
    super.key,
  });

  final PlayerIconType type;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final resolvedSize = size ?? context.appSize.xxlg;

    return SizedBox(
      width: resolvedSize,
      height: resolvedSize,
      child: CustomPaint(
        painter: _PlayerIconPainter(type: type, color: color),
      ),
    );
  }
}

class _PlayerIconPainter extends CustomPainter {
  _PlayerIconPainter({required this.type, required this.color});

  final PlayerIconType type;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.25
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (type == PlayerIconType.o) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 - paint.strokeWidth / 2,
        paint,
      );
    } else {
      final inset = paint.strokeWidth / 2;
      canvas
        ..drawLine(
          Offset(inset, inset),
          Offset(size.width - inset, size.height - inset),
          paint,
        )
        ..drawLine(
          Offset(size.width - inset, inset),
          Offset(inset, size.height - inset),
          paint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _PlayerIconPainter oldDelegate) {
    return oldDelegate.type != type || oldDelegate.color != color;
  }
}
