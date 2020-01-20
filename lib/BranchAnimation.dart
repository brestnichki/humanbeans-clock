import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

// Funciton that returns animation used by the animation builder
//
// [controller] is the [AnimationController] that controls the animation.
// [keyframes] is the list of breakpoints for the animation
// [interpolation] is used to orchestrate the staggered animations
Animation<double> setupRotationZ(AnimationController controller,
    List<Keyframe<double>> keyframes, Interval interval) {
  return Interpolation(keyframes: keyframes)
      .animate(CurvedAnimation(parent: controller, curve: interval));
}

// Class that wraps it's child in the [AnimatedBuilder] to play the "Idle Animation"
//
// The class creates it's animation and builds the [AnimatedBuilder]
class BranchAnimation extends StatelessWidget {
  BranchAnimation(
      {Key key,
      this.child,
      this.transformOrigin = const FractionalOffset(0, 0),
      @required AnimationController animationController,
      @required List<Keyframe> keyframes,
      @required Interval interval})
      : assert(animationController != null),
        assert(keyframes != null && keyframes.length > 0),
        assert(interval != null),
        this.rotationZ =
            setupRotationZ(animationController, keyframes, interval),
        super(key: key);

  // The animation of rotation of the branch
  final Animation<double> rotationZ;
  // Origin of the roration
  final Alignment transformOrigin;
  // The child to be used in the [AnimatedBuilder]
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // Listen for the animation value to change
      animation: Listenable.merge([this.rotationZ]),
      child: this.child,
      builder: (context, widget) {
        return Transform.rotate(
          alignment: this.transformOrigin,
          angle: this.rotationZ.value,
          child: widget,
        );
      },
    );
  }
}
