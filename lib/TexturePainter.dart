import 'dart:ui';
import 'package:flutter/material.dart' hide Image;

class TexturePainter extends CustomPainter{
  final Paint screenPaint = Paint()
    ..blendMode = BlendMode.screen;

  final Paint multiplyPaint = Paint()
    ..blendMode = BlendMode.multiply;

  final Image screenTexture;
  final Image multiplyTexture;

  TexturePainter({ this.screenTexture, this.multiplyTexture });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(
        this.screenTexture,
        Offset(0, 0),
        this.screenPaint
    );

    canvas.drawImage(
        this.multiplyTexture,
        Offset(0, 0),
        this.multiplyPaint
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}