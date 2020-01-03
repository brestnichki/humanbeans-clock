import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> setupRotationZ(AnimationController controller, List<Keyframe<double>> keyframes, Interval interval) {
  return
    Interpolation(
        keyframes: keyframes
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: interval
        )
    );
}


class BranchAnimation extends StatelessWidget {

  BranchAnimation({
    Key key,
    this.child,
    this.transformOrigin = const FractionalOffset(0, 0),
    @required AnimationController animationController,
    @required List<Keyframe> keyframes,
    @required Interval interval
  }) :  assert( animationController != null ),
        assert( keyframes != null && keyframes.length > 0),
        assert( interval != null ),
        this.rotationZ = setupRotationZ(animationController, keyframes, interval),
        super(key: key);

  final Animation<double> rotationZ;
  final Alignment transformOrigin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.rotationZ
      ]),
      child: this.child,
      builder: (context, widget){
        return Transform.rotate(
            alignment: this.transformOrigin,
            angle: this.rotationZ.value,
            child: widget,
        );
      },
    );
  }
}
