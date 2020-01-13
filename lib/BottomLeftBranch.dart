import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/LeafAnimation.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';
import 'BranchAnimation.dart';

class BottomLeftBranch extends StatelessWidget {

  const BottomLeftBranch({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(320),
      height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(270),
      child: BranchAnimation(
        animationController:  ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
        keyframes: <Keyframe<double>>[
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.9, value: 0.03),
          Keyframe<double>(fraction: 1, value: 0)
        ],
        interval: Interval(0, 1, curve: Curves.easeOutQuad),
        transformOrigin: FractionalOffset(0, 0.5),
        child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(11),
                left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(163),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(56),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(79),
                  child: LeafAnimation(
                    transformOrigin: FractionalOffset(0, 0.5),
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex0').activeAnimationWidgetIndex == 0,
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0006_F_Leaf_L_3.png',
                      fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(27),
                left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(20),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 0),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(86),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(91),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive:  ClockUiInheritedModel.of(context, 'activeAnimationIndex1').activeAnimationWidgetIndex == 1,
                      transformOrigin: FractionalOffset(0.2, 0),
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0005_F_Leaf_L_2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(165),
                left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(73),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 1),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(86),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(88),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex2').activeAnimationWidgetIndex == 2,
                      transformOrigin: FractionalOffset(0.2, 1),
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0004_F_Leaf_L_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(216),
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(45),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.03),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 1),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(87),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(114),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0008_F_B_Left_2.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(301),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(171),
                  child: Image.asset(
                      'assets/images/Pngs_Flat_0007_F_B_Left.png',
                      fit: BoxFit.contain
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
