import 'dart:ui';
import 'package:flutter/material.dart' hide Image;

// [CustomPainter] painting the texture effect on the screen
//
// Used for the [BlendMode] effect it provides
class TexturePainter extends CustomPainter {
  final Paint screenPaint = Paint()..blendMode = BlendMode.screen;

  final Paint multiplyPaint = Paint()..blendMode = BlendMode.multiply;

  final Image screenTexture;
  final Image multiplyTexture;

  // Cosntructor accepting [dart:ui.Image]s for the texture
  TexturePainter({this.screenTexture, this.multiplyTexture});

  @override
  void paint(Canvas canvas, Size size) {
    // Get the first image size
    final screenImageSize = Size(this.screenTexture.width.toDouble(),
        this.screenTexture.height.toDouble());
    final screenSrc = Offset.zero & screenImageSize;
    // Get the screen size
    final dst = Offset.zero & size;

    // Fit the image in the screen size and paint
    canvas.drawImageRect(this.screenTexture, screenSrc, dst, this.screenPaint);

    // Get the second image size
    final multiplyImageSize = Size(this.multiplyTexture.width.toDouble(),
        this.multiplyTexture.height.toDouble());
    final multiplySrc = Offset.zero & multiplyImageSize;

    // Fit the image in the screen and paint
    canvas.drawImageRect(
        this.multiplyTexture, multiplySrc, dst, this.multiplyPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // It paints the same all the time
    return false;
  }
}
