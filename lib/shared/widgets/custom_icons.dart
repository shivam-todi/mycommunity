import 'package:flutter/material.dart';

class CustomIcons {
  static Widget buildACIcon(Color color) {
    return CustomPaint(
      size: const Size(24, 24),
      painter: _ACIconPainter(color),
    );
  }

  static Widget buildSwimmingPoolIcon(Color color) {
    return CustomPaint(
      size: const Size(24, 24),
      painter: _SwimmingPoolIconPainter(color),
    );
  }
}

class _ACIconPainter extends CustomPainter {
  final Color color;

  _ACIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path1 = Path();
    path1.moveTo(4, size.height * 0.3);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.2, size.width * 0.5, size.height * 0.3);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 0.4, size.width - 4, size.height * 0.3);

    final path2 = Path();
    path2.moveTo(4, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width - 4, size.height * 0.5);

    final path3 = Path();
    path3.moveTo(4, size.height * 0.7);
    path3.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.7);
    path3.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width - 4, size.height * 0.7);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SwimmingPoolIconPainter extends CustomPainter {
  final Color color;

  _SwimmingPoolIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path1 = Path();
    path1.moveTo(4, size.height * 0.3);
    path1.quadraticBezierTo(size.width * 0.25, size.height * 0.2, size.width * 0.5, size.height * 0.3);
    path1.quadraticBezierTo(size.width * 0.75, size.height * 0.4, size.width - 4, size.height * 0.3);

    final path2 = Path();
    path2.moveTo(4, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.75, size.height * 0.6, size.width - 4, size.height * 0.5);

    final path3 = Path();
    path3.moveTo(4, size.height * 0.7);
    path3.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.7);
    path3.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width - 4, size.height * 0.7);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

