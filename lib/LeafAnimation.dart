import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> setupRotation(AnimationController controller, List<Keyframe<double>> keyframes, Interval interval) {
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

Animation<double> setupTranslationX(AnimationController controller){
  return
    Interpolation(
      keyframes: [
        Keyframe<double>(fraction: 0, value: 0),
        Keyframe<double>(fraction: 0.999, value: 800),
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

Animation<double> setupTranslationY(AnimationController controller){
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.999, value: -480),
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
                0.5, 1, curve: Curves.easeOutQuad
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
                0.5, 1, curve: Curves.easeOutQuad
            )
        )
    );
}

Animation<double> setupOpacity(AnimationController controller){
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: 1),
          Keyframe<double>(fraction: 0.001, value: 0),
          Keyframe<double>(fraction: 0.999, value: 0),
          Keyframe<double>(fraction: 1, value: 1),
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.49, 0.51, curve: Curves.easeOutQuad
            )
        )
    );
}



class LeafAnimation extends StatelessWidget {

  LeafAnimation({
    Key key,
    this.child,
    this.transformOrigin = const FractionalOffset(0, 0),
    @required AnimationController idleController,
    @required AnimationController activeController,
    @required List<Keyframe<double>> keyframes,
    @required Interval interval
  }) :  assert( idleController != null ),
        assert( keyframes != null && keyframes.length > 0),
        assert( interval != null ),
        this.rotation = setupRotation(idleController, keyframes, interval),
        this.translationX = activeController != null ? setupTranslationX(activeController) : null,
        this.translationY = activeController != null ? setupTranslationY(activeController): null,
        this.scaleX = activeController != null ? setupScaleX(activeController) : null,
        this.scaleY = activeController != null ? setupScaleY(activeController) : null,
        this.opacity = activeController != null ? setupOpacity(activeController) : null,
        super(key: key);

  final Animation<double> rotation;
  final Animation<double> translationX;
  final Animation<double> translationY;
  final Animation<double> scaleX;
  final Animation<double> scaleY;
  final Animation<double> opacity;
  final Alignment transformOrigin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var activeAnimatedBuilder = AnimatedBuilder(
      animation: Listenable.merge([
        this.translationX,
        this.translationY,
        this.scaleX,
        this.scaleY,
        this.opacity
      ]),
      child: this.child,
      builder: (context, widget){
        return Transform.translate(
            offset: Offset(
                this.translationX.value,
                this.translationY.value
            ),
            child: Transform(
                alignment: this.transformOrigin,
                transform: Matrix4.diagonal3Values(this.scaleX.value, this.scaleY.value, 1.0),
                child: Opacity(
                    opacity: this.opacity.value,
                    child: widget
                )
            )
        );
      },
    );


    return AnimatedBuilder(
      animation: Listenable.merge([
        this.rotation
      ]),
      child: this.translationX == null ? this.child : activeAnimatedBuilder,
      builder: (context, widget){
        return Transform.rotate(
          alignment: this.transformOrigin,
          angle: this.rotation.value,
          child: widget,
        );
      },
    );
  }
}
