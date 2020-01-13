import 'dart:math';

import 'package:flare_flutter/flare_controls.dart';

class BirdAnimations {
  final String _flyInAnimation = "Flying_in";

  final String _flyOutAnimation = 'Flying_Away';
  final String _napAnimation = 'Nap';
  final String _groomingAnimation = 'Grooming';
  final String _wingSpanAnimaiton = 'Wing_span';
  final String _wingMoveAnimation = 'Wings_Move';
  final String _headMoveAnimation = 'Flying_Away';

  String getFlyIn() {
    return _flyInAnimation;
  }

  String getFlyOut() {
    return _flyOutAnimation;
  }

  String getRandom() {
    return [
      _napAnimation,
      _groomingAnimation,
      _wingMoveAnimation,
      _wingSpanAnimaiton,
      _headMoveAnimation
    ][Random().nextInt(5)];
  }
}