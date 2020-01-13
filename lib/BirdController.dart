import 'package:flare_flutter/flare_controls.dart';

class BirdController extends FlareControls{
  final Function onAnimationEnd;

  BirdController({ this.onAnimationEnd });

  @override
  void onCompleted(String name) {
    this.onAnimationEnd(name);
    super.onCompleted(name);
  }
}