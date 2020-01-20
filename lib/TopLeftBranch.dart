import 'package:clock/BranchAnimation.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/Leaf.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

// Widget that holds the elements for the top left "branch"
//
// All the widgets in the class are aligned to the top left
// and are scaled
class TopLeftBranch extends StatelessWidget {
  const TopLeftBranch({Key key}) : super(key: key);

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
        width: model.utils.scaleDimentions(410),
        height: model.utils.scaleDimentions(280),
        child: BranchAnimation(
          animationController: model.idleAnimation,
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
                top: 0,
                left: 0,
                child: Container(
                  width: model.utils.scaleDimentions(368),
                  height: model.utils.scaleDimentions(191),
                  child: Image.asset(
                      "assets/images/Pngs_Flat_0033_B_Br_Left.png",
                      fit: BoxFit.contain),
                ),
              ),
              Positioned(
                top: model.utils.scaleDimentions(110),
                left: model.utils.scaleDimentions(115),
                child: BranchAnimation(
                  animationController: model.idleAnimation,
                  keyframes: <Keyframe<double>>[
                    Keyframe<double>(fraction: 0, value: 0),
                    Keyframe<double>(fraction: 0.9, value: -0.06),
                    Keyframe<double>(fraction: 1, value: 0)
                  ],
                  interval: Interval(0, 1, curve: Curves.easeOutQuad),
                  transformOrigin: FractionalOffset(0.1, 0),
                  child: Container(
                    width: model.utils.scaleDimentions(155),
                    height: model.utils.scaleDimentions(122),
                    child: Image.asset(
                      'assets/images/Pngs_Flat_0034_B_Br_Left_1.png',
                    ),
                  ),
                ),
              ),
              Leaf(
                index: 3,
                top: 77,
                left: 359,
                width: 47,
                height: 98,
                offset: FractionalOffset(0.05, 0),
                imageUri: 'assets/images/Pngs_Flat_0027_B_Leaf_L_6.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
              Leaf(
                index: 4,
                top: 69,
                left: 212,
                width: 80,
                height: 68,
                offset: FractionalOffset(0, 0),
                imageUri: 'assets/images/Pngs_Flat_0028_B_Leaf_L_5.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
              Leaf(
                index: 5,
                top: 23,
                left: 180,
                width: 55,
                height: 21,
                offset: FractionalOffset(0, 0.8),
                imageUri: 'assets/images/Pngs_Flat_0029_B_leaf_L_4.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
              Leaf(
                index: 6,
                top: 19,
                left: 105,
                width: 76,
                height: 36,
                offset: FractionalOffset(1, 0.6),
                imageUri: 'assets/images/Pngs_Flat_0030_B_Leaf_L_3.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
              Leaf(
                index: 7,
                top: 39,
                left: 15,
                width: 58,
                height: 60,
                offset: FractionalOffset(1, 0.9),
                imageUri: 'assets/images/Pngs_Flat_0031_B_Leaf_L_2.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
              Leaf(
                index: 8,
                top: 185,
                left: 22,
                width: 61,
                height: 85,
                offset: FractionalOffset(1, 0),
                imageUri: 'assets/images/Pngs_Flat_0032_B_Leaf_L_1.png',
                keyframes: <Keyframe<double>>[
                  Keyframe<double>(fraction: 0, value: 0),
                  Keyframe<double>(fraction: 0.9, value: -0.06),
                  Keyframe<double>(fraction: 1, value: 0)
                ],
              ),
            ],
          ),
        ));
  }
}
