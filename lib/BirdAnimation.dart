import 'package:clock/ImagesInheritedWidget.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';
import 'HaloPainter.dart';

Animation<double> setupTranslationX(AnimationController controller) {
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: -400),
          Keyframe<double>(fraction: .5, value: 0),
          Keyframe<double>(fraction: 1, value: 400)
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0, 1, curve: Curves.easeOutQuad)
        )
    );
}

Animation<double> setupTranslationY(AnimationController controller) {
  return
    Interpolation(
        keyframes: [
          Keyframe<double>(fraction: 0, value: -400),
          Keyframe<double>(fraction: .5, value: 0),
          Keyframe<double>(fraction: 1, value: 400)
        ]
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0, 1, curve: Curves.easeOutQuad)
        )
    );
}

class BirdAnimation extends StatelessWidget {
  BirdAnimation({
    Key key,
    @required AnimationController animationController,
    this.child
  }) :  assert( animationController != null ),
        this.translateX = setupTranslationX(animationController),
        this.translateY = setupTranslationY(animationController),
        super(key: key);

  final Animation<double> translateX;
  final Animation<double> translateY;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.translateX,
        this.translateY
      ]),
      child: this.child,
      builder: (context, widget){
        return CustomPaint(
          foregroundPainter: HaloPainter(
            birdHalo: ImagesInheritedWidget.of(context).birdHalo,
            offsetX: this.translateX.value,
            offsetY: this.translateY.value
          ),
          child: widget
        );
      }
    );
  }
}
