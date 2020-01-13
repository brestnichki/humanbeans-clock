import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/LeafAnimation.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

class TopRightBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(436),
      height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(436),
      child: BranchAnimation(
        animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
        keyframes: <Keyframe<double>>[
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.9, value: -0.03),
          Keyframe<double>(fraction: 1, value: 0)
        ],
        interval: Interval(0, 1, curve: Curves.easeOutQuad),
        transformOrigin: FractionalOffset(0.3, 0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(70),
              right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(16),
              child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: 0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0, 1),
                  child: SizedBox(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(44),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(85),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex13').activeAnimationWidgetIndex == 13,
                      transformOrigin: FractionalOffset(0, 1),
                      toRight: false,
                      child: Image.asset(
                          "assets/images/Pngs_Flat_0023_B_Leaf_R_4.png",
                          fit: BoxFit.contain
                      ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(16),
              right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(40),
              child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0, 1),
                  child: SizedBox(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(102),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(107),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex14').activeAnimationWidgetIndex == 14,
                      transformOrigin: FractionalOffset(0, 1),
                      toRight: false,
                      child: Image.asset(
                          "assets/images/Pngs_Flat_0024_B_Leaf_R_3.png",
                          fit: BoxFit.contain
                      ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(240),
              right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(63),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(1, 0.85),
                child: SizedBox(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(263),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(78),
                  child: Image.asset(
                    "assets/images/Pngs_Flat_0037_B_Br_right_2.png",
                    fit: BoxFit.contain
                  ),
                )
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(435),
                height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(140),
                child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: 0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.5, 0.85),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                        top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(14),
                        right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(234),
                        child: BranchAnimation(
                          animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: -0.09),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(0.3, 1),
                          child: Container(
                            width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(73),
                            height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(79),
                            child: LeafAnimation(
                              activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                              isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex15').activeAnimationWidgetIndex == 15,
                              transformOrigin: FractionalOffset(0.3, 1),
                              toRight: false,
                              child: Image.asset(
                                  'assets/images/Pngs_Flat_0025_B_Leaf_R_2.png'
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(32),
                        right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(352),
                        child: BranchAnimation(
                          animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: 0.09),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(1, 0.5),
                          child: Container(
                            width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(70),
                            height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(18),
                            child: LeafAnimation(
                              activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                              isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex16').activeAnimationWidgetIndex == 17,
                              transformOrigin: FractionalOffset(1, 0.5),
                              toRight: false,
                              child: Image.asset(
                                  'assets/images/Pngs_Flat_0026_B_Leaf_R_1.png'
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(37),
                        right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(162),
                        child: SizedBox(
                          width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(201),
                          height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(82),
                          child: Image.asset(
                              "assets/images/Pngs_Flat_0036_B_Br_Right_1.png",
                              fit: BoxFit.contain
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(37),
              child: Container(
                width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(153),
                height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(389),
                child: Image.asset(
                    'assets/images/Pngs_Flat_0035_B_Br_right.png',
                    fit: BoxFit.contain
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(153),
              right: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(16),
              child: BranchAnimation(
                  animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: 0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0, 0),
                  child: SizedBox(
                    width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(45),
                    height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(127),
                    child: LeafAnimation(
                      activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                      isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex17').activeAnimationWidgetIndex == 17,
                      transformOrigin: FractionalOffset(0, 0),
                      toRight: false,
                      child: Image.asset(
                          "assets/images/Pngs_Flat_0022_B_Leaf_R_5.png",
                          fit: BoxFit.contain
                      ),
                    ),
                  )
              ),
            ),
          ]
        )
      ),
    );
  }
}
