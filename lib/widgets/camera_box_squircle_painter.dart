
import 'package:flutter/material.dart';

class CameraBoxSquirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    double cornerRadius = 40.0;
    double elongate = 20;

    Path path = Path()
      ..moveTo(cornerRadius, 0)
      ..moveTo(size.width - cornerRadius, 0)
      ..arcToPoint(Offset(size.width, cornerRadius),
          radius: Radius.circular(cornerRadius))
      ..moveTo(size.width, size.height - cornerRadius)
      ..arcToPoint(Offset(size.width - cornerRadius, size.height),
          radius: Radius.circular(cornerRadius))
      ..moveTo(cornerRadius, size.height)
      ..arcToPoint(Offset(0, size.height - cornerRadius),
          radius: Radius.circular(cornerRadius))
      ..moveTo(0, cornerRadius)
      ..arcToPoint(Offset(cornerRadius, 0),
          radius: Radius.circular(cornerRadius));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
