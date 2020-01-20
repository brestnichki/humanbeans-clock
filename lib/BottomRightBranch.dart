import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/Leaf.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

// Widget that holds the elements for the botttom right "branch"
//
// All the widgets in the class are aligned to the bottom right
// and are scaled
class BottomRightBranch extends StatelessWidget {
  const BottomRightBranch({Key key}) : super(key: key);

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
        width: model.utils.scaleDimentions(490),
        height: model.utils.scaleDimentions(250),
        child: BranchAnimation(
            animationController: model.idleAnimation,
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
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: ClockUiInheritedModel.of(context, 'size')
                        .utils
                        .scaleDimentions(400),
                    height: ClockUiInheritedModel.of(context, 'size')
                        .utils
                        .scaleDimentions(138),
                    child: Image.asset(
                        'assets/images/Pngs_Flat_0014_F_B_Right.png',
                        fit: BoxFit.contain),
                  ),
                ),
                Leaf(
                  index: 9,
                  bottom: 30,
                  right: 397,
                  width: 86,
                  height: 79,
                  toRight: false,
                  offset: FractionalOffset(1, 0),
                  imageUri: 'assets/images/Pngs_Flat_0009_F_Leaf_R_1.png',
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.09),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                ),
                Leaf(
                    index: 10,
                    bottom: 22,
                    right: 352,
                    width: 39,
                    height: 28,
                    toRight: false,
                    offset: FractionalOffset(1, 1),
                    imageUri: 'assets/images/Pngs_Flat_0010_F_Leaf_R_2.png',
                    keyframes: <Keyframe<double>>[
                      Keyframe<double>(fraction: 0, value: 0),
                      Keyframe<double>(fraction: 0.9, value: 0.09),
                      Keyframe<double>(fraction: 1, value: 0)
                    ]),
                Leaf(
                  index: 11,
                  bottom: 10,
                  right: 55,
                  width: 102,
                  height: 58,
                  toRight: false,
                  offset: FractionalOffset(1, 0.2),
                  imageUri: 'assets/images/Pngs_Flat_0012_F_Leaf_R_4.png',
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: 0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                ),
                Leaf(
                  index: 12,
                  bottom: 30,
                  right: 22,
                  width: 35,
                  height: 38,
                  toRight: false,
                  offset: FractionalOffset(0, 0.25),
                  imageUri: 'assets/images/Pngs_Flat_0013_F_Leaf_R_5.png',
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.12),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: model.utils.scaleDimentions(280),
                    height: model.utils.scaleDimentions(220),
                    child: BranchAnimation(
                      animationController: model.idleAnimation,
                      keyframes: <Keyframe<double>>[
                        Keyframe<double>(fraction: 0, value: 0),
                        Keyframe<double>(fraction: 0.9, value: -0.06),
                        Keyframe<double>(fraction: 1, value: 0)
                      ],
                      interval: Interval(0, 1, curve: Curves.easeOutQuad),
                      transformOrigin: FractionalOffset(0.5, 0.6),
                      child: Stack(fit: StackFit.expand, children: <Widget>[
                        Leaf(
                          index: 13,
                          bottom: 107,
                          right: 193,
                          width: 70,
                          height: 93,
                          toRight: false,
                          offset: FractionalOffset(0.9, 1),
                          imageUri:
                              'assets/images/Pngs_Flat_0011_F_Leaf_R_3.png',
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: 0.20),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                        ),
                        Positioned(
                          bottom: model.utils.scaleDimentions(74),
                          right: model.utils.scaleDimentions(103),
                          child: Container(
                            width: model.utils.scaleDimentions(101),
                            height: model.utils.scaleDimentions(38),
                            child: Image.asset(
                              'assets/images/Pngs_Flat_0015_F_B_Right_2.png',
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            )));
  }
}
