import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/LeafAnimation.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

class BottomRightBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(490),
        height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(250),
        child: BranchAnimation(
          animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
          keyframes: <Keyframe<double>>[
            Keyframe<double>(fraction: 0, value: 0),
            Keyframe<double>(fraction: 0.9, value: -0.03),
            Keyframe<double>(fraction: 1, value: 0)
          ],
          interval: Interval(0, 1, curve: Curves.easeOutQuad),
          transformOrigin: FractionalOffset(1, 0.5),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(30),
                right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(397),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(1, 0),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(86),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(79),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex9').activeAnimationWidgetIndex == 9,
                      transformOrigin: FractionalOffset(1, 0),
                      toRight: false,
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0009_F_Leaf_R_1.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(352),
                right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(22),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(1, 1),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(39),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(28),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex10').activeAnimationWidgetIndex == 10,
                      transformOrigin: FractionalOffset(1, 1),
                      toRight: false,
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0010_F_Leaf_R_2.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(10),
                right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(55),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.8, 0),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(102),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(58),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex11').activeAnimationWidgetIndex == 11,
                      transformOrigin: FractionalOffset(0.8, 0),
                      toRight: false,
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0012_F_Leaf_R_4.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(30),
                right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(22),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 0),
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(35),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(38),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex12').activeAnimationWidgetIndex == 12,
                      transformOrigin: FractionalOffset(0.2, 0),
                      toRight: false,
                      child: Image.asset(
                        'assets/images/Pngs_Flat_0013_F_Leaf_R_5.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SizedBox(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(280),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(220),
                  child: BranchAnimation(
                    animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                    keyframes: <Keyframe<double>>[
                      Keyframe<double>(fraction: 0, value: 0),
                      Keyframe<double>(fraction: 0.9, value: -0.06),
                      Keyframe<double>(fraction: 1, value: 0)
                    ],
                    interval: Interval(0, 1, curve: Curves.easeOutQuad),
                    transformOrigin: FractionalOffset(0.5, 0.6),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(74),
                          right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(103),
                          child: Container(
                            width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(101),
                            height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(38),
                            child: Image.asset(
                              'assets/images/Pngs_Flat_0015_F_B_Right_2.png',
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(107),
                          right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(193),
                          child: BranchAnimation(
                            animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                            keyframes: <Keyframe<double>>[
                              Keyframe<double>(fraction: 0, value: 0),
                              Keyframe<double>(fraction: 0.9, value: 0.09),
                              Keyframe<double>(fraction: 1, value: 0)
                            ],
                            interval: Interval(0, 1, curve: Curves.easeOutQuad),
                            transformOrigin: FractionalOffset(1, 1),
                            child: Container(
                              width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(70),
                              height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(93),
                              child: Image.asset(
                                'assets/images/Pngs_Flat_0011_F_Leaf_R_3.png'
                              ),
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(400),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(138),
                  child: Image.asset(
                      'assets/images/Pngs_Flat_0014_F_B_Right.png',
                      fit: BoxFit.contain
                  ),
                ),
              ),
            ],
          )
        )
      );
  }
}
