import 'package:clock/AnimationsInheritedWidget.dart';
import 'package:clock/Utils.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';
import 'BranchAnimation.dart';

class BottomLeftBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils u = Utils(context: context);
    
    return SizedBox(
      width: u.scaleDimentions(320),
      height: u.scaleDimentions(270),
      child: BranchAnimation(
        animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
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
                bottom: u.scaleDimentions(11),
                left: u.scaleDimentions(163),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 0),
                  child: Container(
                    width: u.scaleDimentions(56),
                    height: u.scaleDimentions(79),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0006_F_Leaf_L_3.png',
                      fit: BoxFit.contain
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(27),
                left: u.scaleDimentions(20),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 0),
                  child: Container(
                    width: u.scaleDimentions(86),
                    height: u.scaleDimentions(91),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0005_F_Leaf_L_2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: u.scaleDimentions(165),
                left: u.scaleDimentions(73),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 1),
                  child: Container(
                    width: u.scaleDimentions(86),
                    height: u.scaleDimentions(88),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0004_F_Leaf_L_1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: u.scaleDimentions(216),
                bottom: u.scaleDimentions(45),
                child: BranchAnimation(
                  animationController: AnimationsInheritedWidget.of(context).idleAnimationsController,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.2, 1),
                  child: Container(
                    width: u.scaleDimentions(87),
                    height: u.scaleDimentions(114),
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
                  width: u.scaleDimentions(301),
                  height: u.scaleDimentions(171),
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
