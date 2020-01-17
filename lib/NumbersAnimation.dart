import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

Animation<double> setupTranslationY(AnimationController controller, List<Keyframe<double>> keyframes, Interval interval) {
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


class NumbersAnimation extends StatelessWidget {

  NumbersAnimation({
    Key key,
    this.child,
    this.animationController,
    @required this.keyframes,
    @required Interval interval,
  }) :  assert( keyframes != null && keyframes.length > 0),
        assert( interval != null ),
        this.translationY = setupTranslationY(animationController, keyframes, interval),
        super(key: key);

  final Animation<double> translationY;
  final AnimationController animationController;
  final Widget child;
  final List<Keyframe<double>> keyframes;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        this.translationY
      ]),
      child: this.child,
      builder: (context, widget) {
        return Transform.translate(
          offset: Offset(0, this.translationY.value),
          child: widget,
        );
      },
    );
  }
}
