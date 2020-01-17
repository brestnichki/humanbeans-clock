import 'package:clock/ClockUiInheritedModel.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

import 'BranchAnimation.dart';
import 'LeafAnimation.dart';

class Leaf extends StatelessWidget {
  final double width;
  final double height;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final List<Keyframe<double>>keyframes;
  final Interval interval;
  final FractionalOffset offset;
  final String imageUri;
  final int index;
  final bool toRight;

  const Leaf({
    Key key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.interval = const Interval(0, 1, curve: Curves.easeOutQuad),
    this.offset = const FractionalOffset(0, 0),
    this.toRight = true,
    @required this.width,
    @required this.height,
    @required this.keyframes,
    @required this.imageUri,
    @required this.index
  }) : super(key: key );

  @override
  Widget build(BuildContext context) {
    final model = ClockUiInheritedModel.of(context, 'size');

    return
    Positioned(
      top: this.top != null ? model.utils.scaleDimentions(this.top) : null,
      left: this.left != null ? model.utils.scaleDimentions(this.left) : null,
      right: this.right != null ? model.utils.scaleDimentions(this.right) : null,
      bottom: this.bottom != null ? model.utils.scaleDimentions(this.bottom) : null,
      child: Container(
        width: model.utils.scaleDimentions(this.width),
        height: model.utils.scaleDimentions(this.height),
        child: BranchAnimation(
          animationController:  model.idleAnimation,
          keyframes: this.keyframes,
          interval: this.interval,
          transformOrigin: this.offset,
          child: LeafAnimation(
            transformOrigin: this.offset,
            activeController: model.activeAnimation,
            isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex$this.index').activeAnimationWidgetIndex == this.index,
            toRight: this.toRight,
            child: Image.asset(
                this.imageUri,
                fit: BoxFit.contain
            ),
          ),
        ),
      ),
    );
  }
}
