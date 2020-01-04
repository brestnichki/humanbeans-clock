import 'package:clock/AnimationsInheritedWidget.dart';
import 'package:clock/BranchAnimation.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

class TopLeftBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils u = Utils(context: context);

    return SizedBox(
      width: u.scaleDimentions(410),
      height: u.scaleDimentions(280),
      child: BranchAnimation(
        animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
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
              top: u.scaleDimentions(77),
              left: u.scaleDimentions(359),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 0),
                child: Container(
                  width: u.scaleDimentions(47),
                  height: u.scaleDimentions(98),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0027_B_Leaf_L_6.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(69),
              left: u.scaleDimentions(212),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 0),
                child: Container(
                  width: u.scaleDimentions(80),
                  height: u.scaleDimentions(68),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0028_B_Leaf_L_5.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(23),
              left: u.scaleDimentions(180),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0, 1),
                child: Container(
                  width: u.scaleDimentions(55),
                  height: u.scaleDimentions(21),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0029_B_leaf_L_4.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(19),
              left: u.scaleDimentions(105),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(1, 0.8),
                child: Container(
                  width: u.scaleDimentions(76),
                  height: u.scaleDimentions(32),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0030_B_Leaf_L_3.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(39),
              left: u.scaleDimentions(15),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(1, 1),
                child: Container(
                  width: u.scaleDimentions(58),
                  height: u.scaleDimentions(60),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0031_B_Leaf_L_2.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(185),
              left: u.scaleDimentions(22),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0.2, 0),
                child: Container(
                  width: u.scaleDimentions(61),
                  height: u.scaleDimentions(85),
                  child: Image.asset(
                    'assets/images/Pngs_Flat_0032_B_Leaf_L_1.png',
                  ),
                ),
              ),
            ),
            Positioned(
              top: u.scaleDimentions(110),
              left: u.scaleDimentions(115),
              child: BranchAnimation(
                animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
                interval: Interval(0, 1, curve: Curves.easeOutQuad),
                transformOrigin: FractionalOffset(0.1, 0),
                child: Container(
                  width: u.scaleDimentions(155),
                  height: u.scaleDimentions(122),
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
                width: u.scaleDimentions(368),
                height: u.scaleDimentions(191),
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
