import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

// Functions returning the animations for the [Leaf] active animation
//
// They accept the controller as argument and have preset values for the
// [Interpolation] and [Interval].
// During the 'active animation' of the leaf, the 'idle animation' continues.
Animation<double> setupRotation(AnimationController controller) {
  return Interpolation(keyframes: [
    Keyframe<double>(fraction: 0, value: 0),
    Keyframe<double>(fraction: 0.999, value: 3.6),
    Keyframe<double>(fraction: 1, value: 0),
  ]).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.05, 0.35, curve: Curves.easeOut)));
}

Animation<double> setupTranslationX(
    AnimationController controller, bool toRight) {
  return Interpolation(keyframes: [
    Keyframe<double>(fraction: 0, value: 0),
    Keyframe<double>(
        fraction: 0.999, value: (800 * (toRight ? 1 : -1)).toDouble()),
    Keyframe<double>(fraction: 1, value: 0),
  ]).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.05, 0.35, curve: Curves.easeOut)));
}

Animation<double> setupTranslationY(
    AnimationController controller, bool toRight) {
  return Interpolation(keyframes: [
    Keyframe<double>(fraction: 0, value: 0),
    Keyframe<double>(fraction: 0.999, value: 10.0),
    Keyframe<double>(fraction: 1, value: 0),
  ]).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.05, 0.35, curve: Curves.easeOutQuad)));
}

Animation<double> setupScaleX(AnimationController controller) {
  return Interpolation(keyframes: [
    Keyframe<double>(fraction: 0, value: 1),
    Keyframe<double>(fraction: 0.001, value: 0),
    Keyframe<double>(fraction: 1, value: 1),
  ]).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.34, 1, curve: Curves.easeOutQuad)));
}

Animation<double> setupScaleY(AnimationController controller) {
  return Interpolation(keyframes: [
    Keyframe<double>(fraction: 0, value: 1),
    Keyframe<double>(fraction: 0.001, value: 0),
    Keyframe<double>(fraction: 1, value: 1),
  ]).animate(CurvedAnimation(
      parent: controller, curve: Interval(0.34, 1, curve: Curves.easeOutQuad)));
}

// Class building the [AnimatedBuilder] for the 'active animation' of the [Leaf]
//
// Most of the time this widget is not animating, so if there's no [LeafAniamtion.isActive] flag
// true, it builds just the child. When it gets rebuilded with [LeafAniamtion.isActive] flag true,
// it builds the [AnimationController] and plays the animation.
class LeafAnimation extends StatelessWidget {
  // Flag indicating if this widget will animate on this time iteration
  final bool isActive;

  // Constructor that creates the animations if [this.isActive] is true,
  //
  // Otherwise, if [this.isActive] is false, we don't need those values,
  // and we assign them to null
  LeafAnimation(
      {Key key,
      this.child,
      this.transformOrigin = const FractionalOffset(0, 0),
      bool toRight = true,
      @required AnimationController activeController,
      @required this.isActive})
      : assert(activeController != null),
        this.rotation = isActive ? setupRotation(activeController) : null,
        this.translationX =
            isActive ? setupTranslationX(activeController, toRight) : null,
        this.translationY =
            isActive ? setupTranslationY(activeController, toRight) : null,
        this.scaleX = isActive ? setupScaleX(activeController) : null,
        this.scaleY = isActive ? setupScaleY(activeController) : null,
        super(key: key);

  // Animations for transforms during the 'active animations'
  final Animation<double> rotation;
  final Animation<double> translationX;
  final Animation<double> translationY;
  final Animation<double> scaleX;
  final Animation<double> scaleY;
  // The transform origin of the animaitons
  final Alignment transformOrigin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // If [this.Active] flag is true, build the [AnimatedBuilder].
    if (this.isActive) {
      return AnimatedBuilder(
        animation: Listenable.merge([
          this.rotation,
          this.translationX,
          this.translationY,
          this.scaleX,
          this.scaleY,
        ]),
        child: this.child,
        builder: (context, widget) {
          return Transform(
              transform: Matrix4.translationValues(
                  this.translationX.value, this.translationY.value, 0)
                ..scale(this.scaleX.value, this.scaleY.value)
                ..rotateZ(this.rotation.value),
              alignment: this.transformOrigin,
              child: widget);
        },
      );
      // Else build just the child.
    } else {
      return this.child;
    }
  }
}
