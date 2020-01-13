import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> setupRotation(AnimationController controller) {
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.999, value: 3.6),
          Keyframe<double>(fraction: 1, value: 0),
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0, 0.5, curve: Curves.easeOut
            )
        )
    );
}

Animation<double> setupTranslationX(AnimationController controller, bool toRight){
  return
    Interpolation(
      keyframes: [
        Keyframe<double>(fraction: 0, value: 0),
        Keyframe<double>(fraction: 0.999, value: (800 * (toRight ? 1 : - 1 )).toDouble()),
        Keyframe<double>(fraction: 1, value: 0),
      ]
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0, 0.5, curve: Curves.easeOut
        )
      )
    );
}

Animation<double> setupTranslationY(AnimationController controller, bool toRight){
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.999, value: 10.0),
          Keyframe<double>(fraction: 1, value: 0),
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0, 0.5, curve: Curves.easeOutQuad
            )
        )
    );
}

Animation<double> setupScaleX(AnimationController controller){
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 1),
          Keyframe<double>(fraction: 0.001, value: 0),
          Keyframe<double>(fraction: 1, value: 1),
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.49, 1, curve: Curves.easeOutQuad
            )
        )
    );
}

Animation<double> setupScaleY(AnimationController controller){
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 1),
          Keyframe<double>(fraction: 0.001, value: 0),
          Keyframe<double>(fraction: 1, value: 1),
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.49, 1, curve: Curves.easeOutQuad
            )
        )
    );
}



class LeafAnimation extends StatelessWidget {
  final bool isActive;

  LeafAnimation({
    Key key,
    this.child,
    this.transformOrigin = const FractionalOffset(0, 0),
    bool toRight = true,
    @required AnimationController activeController,
    @required this.isActive
  }) :  assert( activeController != null ),
        this.rotation = isActive ? setupRotation(activeController) : null,
        this.translationX = isActive ? setupTranslationX(activeController, toRight) : null,
        this.translationY = isActive ? setupTranslationY(activeController, toRight) : null,
        this.scaleX = isActive ? setupScaleX(activeController) : null,
        this.scaleY = isActive ? setupScaleY(activeController) : null,
        super(key: key);

  final Animation<double> rotation;
  final Animation<double> translationX;
  final Animation<double> translationY;
  final Animation<double> scaleX;
  final Animation<double> scaleY;
  final Alignment transformOrigin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if(this.isActive) {
      return
        AnimatedBuilder(
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
                    this.translationX.value,
                    this.translationY.value,
                    0
                )
                  ..scale(
                      this.scaleX.value,
                      this.scaleY.value
                  )
                  ..rotateZ(
                      this.rotation.value
                  ),
                alignment: this.transformOrigin,
                child: widget
            );
          },
        );
    } else {
      return this.child;
    }
  }
}
