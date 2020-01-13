import 'dart:ui';
import 'package:flutter/material.dart' hide Image;
class HaloPainter extends CustomPainter{
  final Image birdHalo;
  final Image screenTexture;
  final Image multiplyTexture;
  final double offsetX;
  final double offsetY;

  final Paint dodgePaint = Paint()
    ..blendMode = BlendMode.colorDodge;

  HaloPainter({
    this.screenTexture,
    this.multiplyTexture,
    this.offsetX,
    this.offsetY,
    this.birdHalo
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(
        birdHalo,
        Offset(this.offsetX, this.offsetY),
        this.dodgePaint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}