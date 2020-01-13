import 'package:clock/BirdAnimations.dart';
import 'package:flare_flutter/flare_controls.dart';

class BirdController extends FlareControls{
  final Function playNext;
  final Function onEnd;
  final BirdAnimations _birdAnimations = BirdAnimations();

  BirdController({ this.onEnd, this.playNext });

  @override
  void onCompleted(String name) {
    if(name == _birdAnimations.getFlyIn()) {
      this.playNext();
    } else {
      this.onEnd();
    }
    super.onCompleted(name);
  }
}