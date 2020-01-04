import 'dart:ui';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';

class HaloPainter extends CustomPainter{
  final Image birdHalo;
  final double offsetX;
  final double offsetY;

  HaloPainter({ this.offsetX, this.offsetY, this.birdHalo });

  @override
  void paint(Canvas canvas, Size size) {
    if(birdHalo == null) return;

    canvas.drawImage(
        birdHalo,
        Offset(this.offsetX, this.offsetY),
        Paint()
          ..blendMode = BlendMode.colorDodge
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}