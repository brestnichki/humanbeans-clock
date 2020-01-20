import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/Leaf.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

// Widget that holds all the elements for the top right branch
//
// The widgets in this class are absolute positioned to the top right corner
// of the parent and are scaled depending on the screen size
class TopRightBranch extends StatelessWidget {
  const TopRightBranch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We get the model here to avoid going up the three in each of the widget
    //
    // We use the model for the [Utils] class, which scales the widgets with absolute
    // dimentions. The size aspect of the model should change only on screen resize,
    // so the widget should not rebuild
    final ClockUiInheritedModel model =
        ClockUiInheritedModel.of(context, 'size');

    return SizedBox(
      width: model.utils.scaleDimentions(436),
      height: model.utils.scaleDimentions(436),
      child: BranchAnimation(
          animationController: model.idleAnimation,
          keyframes: <Keyframe<double>>[
            Keyframe<double>(fraction: 0, value: 0),
            Keyframe<double>(fraction: 0.9, value: -0.03),
            Keyframe<double>(fraction: 1, value: 0)
          ],
          interval: Interval(0, 1, curve: Curves.easeOutQuad),
          transformOrigin: FractionalOffset(0.3, 0),
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: model.utils.scaleDimentions(435),
                height: model.utils.scaleDimentions(140),
                child: BranchAnimation(
                  animationController: model.idleAnimation,
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
                        top: model.utils.scaleDimentions(37),
                        right: ClockUiInheritedModel.of(context, 'size')
                            .utils
                            .scaleDimentions(162),
                        child: SizedBox(
                          width: model.utils.scaleDimentions(201),
                          height: model.utils.scaleDimentions(82),
                          child: Image.asset(
                              "assets/images/Pngs_Flat_0036_B_Br_Right_1.png",
                              fit: BoxFit.contain),
                        ),
                      ),
                      Leaf(
                        index: 16,
                        top: 14,
                        right: 234,
                        width: 73,
                        height: 79,
                        toRight: false,
                        offset: FractionalOffset(0.3, 1),
                        imageUri: 'assets/images/Pngs_Flat_0025_B_Leaf_R_2.png',
                        keyframes: <Keyframe<double>>[
                          Keyframe<double>(fraction: 0, value: 0),
                          Keyframe<double>(fraction: 0.9, value: -0.09),
                          Keyframe<double>(fraction: 1, value: 0)
                        ],
                      ),
                      Leaf(
                        index: 17,
                        top: 32,
                        right: 352,
                        width: 70,
                        height: 18,
                        toRight: false,
                        offset: FractionalOffset(1, 0.5),
                        imageUri: 'assets/images/Pngs_Flat_0026_B_Leaf_R_1.png',
                        keyframes: <Keyframe<double>>[
                          Keyframe<double>(fraction: 0, value: 0),
                          Keyframe<double>(fraction: 0.9, value: 0.09),
                          Keyframe<double>(fraction: 1, value: 0)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: model.utils.scaleDimentions(240),
              right: model.utils.scaleDimentions(63),
              child: BranchAnimation(
                  animationController: model.idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(1, 0.85),
                  child: SizedBox(
                    width: model.utils.scaleDimentions(263),
                    height: model.utils.scaleDimentions(78),
                    child: Image.asset(
                        "assets/images/Pngs_Flat_0037_B_Br_right_2.png",
                        fit: BoxFit.contain),
                  )),
            ),
            Positioned(
              top: 0,
              right: model.utils.scaleDimentions(37),
              child: Container(
                width: model.utils.scaleDimentions(153),
                height: model.utils.scaleDimentions(389),
                child: Image.asset(
                    'assets/images/Pngs_Flat_0035_B_Br_right.png',
                    fit: BoxFit.contain),
              ),
            ),
            Leaf(
              index: 14,
              top: 70,
              right: 16,
              width: 44,
              height: 85,
              toRight: false,
              offset: FractionalOffset(0.1, 1),
              imageUri: "assets/images/Pngs_Flat_0023_B_Leaf_R_4.png",
              keyframes: <Keyframe<double>>[
                Keyframe<double>(fraction: 0, value: 0),
                Keyframe<double>(fraction: 0.9, value: 0.06),
                Keyframe<double>(fraction: 1, value: 0)
              ],
            ),
            Leaf(
              index: 15,
              top: 16,
              right: 40,
              width: 102,
              height: 107,
              toRight: false,
              offset: FractionalOffset(0, 1),
              imageUri: "assets/images/Pngs_Flat_0024_B_Leaf_R_3.png",
              keyframes: <Keyframe<double>>[
                Keyframe<double>(fraction: 0, value: 0),
                Keyframe<double>(fraction: 0.9, value: -0.06),
                Keyframe<double>(fraction: 1, value: 0)
              ],
            ),
            Leaf(
              index: 18,
              top: 153,
              right: 16,
              width: 45,
              height: 127,
              toRight: false,
              offset: FractionalOffset(0.2, 0),
              imageUri: "assets/images/Pngs_Flat_0022_B_Leaf_R_5.png",
              keyframes: <Keyframe<double>>[
                Keyframe<double>(fraction: 0, value: 0),
                Keyframe<double>(fraction: 0.9, value: 0.06),
                Keyframe<double>(fraction: 1, value: 0)
              ],
            ),
          ])),
    );
  }
}
