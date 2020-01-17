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
    final screenImageSize = Size(this.screenTexture.width.toDouble(), this.screenTexture.height.toDouble());
    final screenSrc = Offset.zero & screenImageSize;
    final dst = Offset.zero & size;

    canvas.drawImageRect(
        this.screenTexture,
        screenSrc,
        dst,
        this.screenPaint
    );

    final multiplyImageSize = Size(this.multiplyTexture.width.toDouble(),this.multiplyTexture.height.toDouble());
    final multiplySrc = Offset.zero & multiplyImageSize;

    canvas.drawImageRect(
        this.multiplyTexture,
        screenSrc,
        dst,
        this.multiplyPaint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}