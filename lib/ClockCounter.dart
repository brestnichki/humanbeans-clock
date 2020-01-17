import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

import 'ClockUiInheritedModel.dart';
import 'NumbersAnimation.dart';

class ClockCounter extends StatelessWidget {

  const ClockCounter({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _secondsTens;
    Widget _minutesOnes;
    Widget _minutesTens;

    final List<Keyframe<double>> exitKeyframes = <Keyframe<double>>[
      Keyframe<double>(fraction: 0, value: 0),
      Keyframe<double>(fraction: 1, value: - MediaQuery.of(context).size.height)
    ];

    List<Keyframe<double>> enterKeyframes = <Keyframe<double>>[
      Keyframe<double>(fraction: 0, value: MediaQuery.of(context).size.height),
      Keyframe<double>(fraction: 1, value: 0)
    ];

    ClockUiInheritedModel model = ClockUiInheritedModel.of(context, 'seconds');


    TextStyle style = TextStyle(
        fontFamily: 'HumanBeansBird',
        fontSize: model.utils.scaleDimentions(159),
        color: Color.fromRGBO(217, 136, 136, 1),
        decoration: TextDecoration.none,
        letterSpacing: model.utils.scaleDimentions(10),
        height: model.utils.scaleDimentions(3)
    );


    if(
      model.clockAnimation.isAnimating &&
          model.prevSeconds.substring(0, 1) != model.seconds.substring(0, 1)
    ){
      _secondsTens = Stack(
          children: <Widget>[
            NumbersAnimation(
              animationController: model.clockAnimation,
              keyframes: exitKeyframes,
              interval: Interval(0.1, 0.95, curve: Curves.easeOutQuad),
              child: Text(
                ((int.parse(model.seconds.substring(0, 1)) + 6 - 1) % 6).toString(),
                style: style,
              ),
            ),
            NumbersAnimation(
              animationController: model.clockAnimation,
              keyframes: enterKeyframes,
              interval: Interval(0.1, 0.95, curve: Curves.easeOutQuad),
              child: Text(
                  model.seconds.substring(0, 1),
                  style: style
              ),
            )
        ]
      );
    } else {
      _secondsTens = Text(
          model.seconds.substring(0, 1),
          style: style
      );
    }

    if(model.clockAnimation.isAnimating && model.prevMinutes.substring(1, 2) != model.minutes.substring(1, 2)){
      _minutesOnes = Stack(
        children: <Widget>[
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: exitKeyframes,
            interval: Interval(0.05, 0.90, curve: Curves.easeOutQuad),
            child: Text(
              ((int.parse(model.minutes.substring(1, 2)) + 10 - 1) % 10).toString(),
              style: style,
            ),
          ),
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: enterKeyframes,
            interval: Interval(0.05, 0.9, curve: Curves.easeOutQuad),
            child: Text(
                model.minutes.substring(1, 2),
                style: style
            ),
          )
        ],
      );
    } else {
      _minutesOnes = Text(
          model.minutes.substring(1, 2),
          style: style
      );
    }

    if(model.clockAnimation.isAnimating && model.prevMinutes.substring(0, 1) != model.minutes.substring(0, 1)){
      _minutesTens = Stack(
        children: <Widget>[
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: exitKeyframes,
            interval: Interval(0, 0.85, curve: Curves.easeOutQuad),
            child: Text(
              ((int.parse(model.minutes.substring(0, 1)) + 6 - 1) % 6).toString(),
              style: style,
            ),
          ),
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: enterKeyframes,
            interval: Interval(0, 0.85, curve: Curves.easeOutQuad),
            child: Text(
                model.minutes.substring(0, 1),
                style: style
            ),
          )
        ],
      );
    } else {
      _minutesTens = Text(
          model.minutes.substring(0, 1),
          style: style
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _minutesTens
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: _minutesOnes
        ),
        SizedBox(
          width: model.utils.scaleDimentions(60),
          height: model.utils.scaleDimentions(80),
          child: Image.asset(
            'assets/images/Dots.png',
            fit: BoxFit.contain,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _secondsTens
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Stack(
            children: <Widget>[
              NumbersAnimation(
                animationController: model.clockAnimation,
                keyframes: exitKeyframes,
                interval: Interval(0.15, 1, curve: Curves.easeOutQuad),
                child: Text(
                  ((int.parse(model.seconds.substring(1, 2)) + 10 - 1) % 10).toString(),
                  style: style,
                ),
              ),
              NumbersAnimation(
                animationController: model.clockAnimation,
                keyframes: enterKeyframes,
                interval: Interval(0.15, 1, curve: Curves.easeOutQuad),
                child: Text(
                    model.seconds.substring(1, 2),
                    style: style
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
