import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/LeafAnimation.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

class TopLeftBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(410),
      height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(280),
      child: BranchAnimation(
        animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
        keyframes: <Keyframe<double>>[
          Keyframe<double>(fraction: 0, value: 0),
          Keyframe<double>(fraction: 0.9, value: 0.03),
          Keyframe<double>(fraction: 1, value: 0)
        ],
        interval: Interval(0, 1, curve: Curves.easeOutQuad),
        transformOrigin: FractionalOffset(0, 0.7),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(77),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(359),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 0),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(47),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(98),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex3').activeAnimationWidgetIndex == 3,
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0027_B_Leaf_L_6.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(69),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(212),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 0),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(80),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(68),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex4').activeAnimationWidgetIndex == 4,
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0028_B_Leaf_L_5.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(23),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(180),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 1),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(55),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(21),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex5').activeAnimationWidgetIndex == 5,
                    transformOrigin: FractionalOffset(0, 1),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0029_B_leaf_L_4.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(19),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(105),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(1, 0.8),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(76),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(32),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex6').activeAnimationWidgetIndex == 6,
                    transformOrigin: FractionalOffset(1, 0.8),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0030_B_Leaf_L_3.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(39),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(15),
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
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(58),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(60),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex7').activeAnimationWidgetIndex == 7,
                    transformOrigin: FractionalOffset(1, 1),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0031_B_Leaf_L_2.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(185),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(22),
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
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(61),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(85),
                  child: LeafAnimation(
                    activeController: ClockUiInheritedModel.of(context, 'activeAnimation').activeAnimation,
                    isActive: ClockUiInheritedModel.of(context, 'activeAnimationIndex8').activeAnimationWidgetIndex == 8,
                    transformOrigin: FractionalOffset(0.2, 0),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0032_B_Leaf_L_1.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(110),
              left: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(115),
              child: BranchAnimation(
                animationController: ClockUiInheritedModel.of(context, 'branchAnimation').idleAnimation,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0.1, 0),
                child: Container(
                  width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(155),
                  height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(122),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0034_B_Br_Left_1.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(368),
                height: ClockUiInheritedModel.of(context, 'size').utils.scaleDimentions(191),
                child: Image.asset(
                  "assets/images/Pngs_Flat_0033_B_Br_Left.png",
                  fit: BoxFit.contain
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
