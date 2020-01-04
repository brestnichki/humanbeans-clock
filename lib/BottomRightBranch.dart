import 'package:clock/AnimationsInheritedWidget.dart';
import 'package:clock/BranchAnimation.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

class BottomRightBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils u = Utils(context: context);

    return
      SizedBox(
        width: u.scaleDimentions(490),
        height: u.scaleDimentions(250),
        child: BranchAnimation(
          animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
          keyframes: <Keyframe<double>>[
            Keyframe<double>(fraction: 0, value: 0),
            Keyframe<double>(fraction: 0.9, value: 0.03),
            Keyframe<double>(fraction: 1, value: 0)
          ],
          interval: Interval(0, 1, curve: Curves.easeOutQuad),
          transformOrigin: FractionalOffset(1, 0.5),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: u.scaleDimentions(30),
                right: u.scaleDimentions(397),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(1, 0),
                  child: Container(
                    width: u.scaleDimentions(86),
                    height: u.scaleDimentions(79),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0009_F_Leaf_R_1.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(352),
                right: u.scaleDimentions(22),
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
                    width: u.scaleDimentions(39),
                    height: u.scaleDimentions(28),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0010_F_Leaf_R_2.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(10),
                right: u.scaleDimentions(55),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.8, 0),
                  child: Container(
                    width: u.scaleDimentions(102),
                    height: u.scaleDimentions(58),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0012_F_Leaf_R_4.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(30),
                right: u.scaleDimentions(22),
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
                    width: u.scaleDimentions(35),
                    height: u.scaleDimentions(38),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0013_F_Leaf_R_5.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(103),
                right: u.scaleDimentions(47),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.8, 1),
                  child: Container(
                    width: u.scaleDimentions(101),
                    height: u.scaleDimentions(38),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0015_F_B_Right_2.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: u.scaleDimentions(400),
                  height: u.scaleDimentions(138),
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
