import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';
import 'ClockUiInheritedModel.dart';
import 'NumbersAnimation.dart';

// Widget that holds the numbers and animations for the clock face
class ClockCounter extends StatelessWidget {
  const ClockCounter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The split single numbers form the pairs of hours and minutes number
    //
    // We use them in a lot of places and i feel it's easeier to declare and asign it
    // here.
    Widget minutesOnes;
    Widget minutesTens;
    Widget hoursOnes;
    Widget hoursTens;

    // The exit animation keyframes  for the numbers
    //
    // It's instantiated here to give access to the MediaQuery which we use to get
    // he height of the screen, so that the numbers go off the screen
    final List<Keyframe<double>> exitKeyframes = <Keyframe<double>>[
      Keyframe<double>(fraction: 0, value: 0),
      Keyframe<double>(fraction: 1, value: -MediaQuery.of(context).size.height)
    ];

    // The enter animation keyframes  for the numbers
    //
    // It's declare it here to give access to the MediaQuery which we use to get
    // he height of the screen, so that the numbers go off the screen
    List<Keyframe<double>> enterKeyframes = <Keyframe<double>>[
      Keyframe<double>(fraction: 0, value: MediaQuery.of(context).size.height),
      Keyframe<double>(fraction: 1, value: 0)
    ];

    // Getting hold of the [ClockUiInheritedModel]
    //
    // Doing it here will cause the entire widget to rebuild on each change in the
    // 'minutes' aspect of the model, but many of the widgets use it anyway
    ClockUiInheritedModel model = ClockUiInheritedModel.of(context, 'minutes');

    // [TextStyle] for the clock's numbers
    //
    // We declare it here to use the [ClockUiInheritedModel]'s utils, to scale it
    // for the current screen
    TextStyle style = TextStyle(
        fontFamily: 'HumanBeansBird',
        fontSize: model.utils.scaleDimentions(159),
        color: Color.fromRGBO(217, 136, 136, 1),
        decoration: TextDecoration.none,
        letterSpacing: 0,
        height: 2.5,
        fontWeight: FontWeight.w400);

    if (model.clockAnimation.isAnimating &&
        model.prevMinutes.substring(1, 2) != model.minutes.substring(1, 2)) {
      // Declare the [Interval] both [AnimatedBuilders] will use
      Interval minutesOnesIterval = Interval(0, 0.7, curve: Curves.easeOutQuad);

      minutesOnes = Stack(
        children: <Widget>[
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: exitKeyframes,
            interval: minutesOnesIterval,
            child: Text(
              ((int.parse(model.minutes.substring(1, 2)) + 10 - 1) % 10)
                  .toString(),
              style: style,
              textScaleFactor: 1,
            ),
          ),
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: enterKeyframes,
            interval: minutesOnesIterval,
            child: Text(
              model.minutes.substring(1, 2),
              style: style,
              textScaleFactor: 1,
            ),
          )
        ],
      );
    } else {
      minutesOnes = Text(
        model.minutes.substring(1, 2),
        style: style,
        textScaleFactor: 1,
      );
    }

    // If the [ClockUiInheritedModel] is animating and there's a change in the first number
    // of the minutes build the two [NumbersAnimation] widgets that are going to play the
    // exit and enter animation respectively.
    if (model.clockAnimation.isAnimating &&
        model.prevMinutes.substring(0, 1) != model.minutes.substring(0, 1)) {
      // Declare the [Interval] both [AnimatedBuilders] will use
      Interval minutesTensInterval =
          Interval(0.1, 0.8, curve: Curves.easeOutQuad);

      minutesTens = Stack(children: <Widget>[
        NumbersAnimation(
          animationController: model.clockAnimation,
          keyframes: exitKeyframes,
          interval: minutesTensInterval,
          child: Text(
            ((int.parse(model.minutes.substring(0, 1)) + 6 - 1) % 6).toString(),
            style: style,
            textScaleFactor: 1,
          ),
        ),
        NumbersAnimation(
          animationController: model.clockAnimation,
          keyframes: enterKeyframes,
          interval: minutesTensInterval,
          child: Text(
            model.minutes.substring(0, 1),
            style: style,
            textScaleFactor: 1,
          ),
        )
      ]);
      // If the animation is not playing, or there's no difference in the old and new numbers just build a simple [Text].
    } else {
      minutesTens = Text(
        model.minutes.substring(0, 1),
        style: style,
        textScaleFactor: 1,
      );
    }

    // If the [ClockUiInheritedModel] is animating and there's a change in the second letter
    // of the hours build the two [NumbersAnimation] widgets that are going to play the
    // exit and enter animation respectively.
    if (model.clockAnimation.isAnimating &&
        model.prevHours.substring(1, 2) != model.hours.substring(1, 2)) {
      // Declare the [Interval] both [AnimatedBuilders] will use
      Interval hoursOnesInterval =
          Interval(0.2, 0.90, curve: Curves.easeOutQuad);

      hoursOnes = Stack(
        children: <Widget>[
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: exitKeyframes,
            interval: hoursOnesInterval,
            child: Text(
              ((int.parse(model.hours.substring(1, 2)) + 10 - 1) % 10)
                  .toString(),
              style: style,
              textScaleFactor: 1,
            ),
          ),
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: enterKeyframes,
            interval: hoursOnesInterval,
            child: Text(
              model.hours.substring(1, 2),
              style: style,
              textScaleFactor: 1,
            ),
          )
        ],
      );
      // If the animation is not playing, or there's no difference in the old and new numbers just build a simple [Text].
    } else {
      hoursOnes = Text(
        model.hours.substring(1, 2),
        style: style,
        textScaleFactor: 1,
      );
    }

    // If the [ClockUiInheritedModel] is animating and there's a change in the first letter
    // of the hours build the two [NumbersAnimation] widgets that are going to play the
    // exit and enter animation respectively.
    if (model.clockAnimation.isAnimating &&
        model.prevHours.substring(0, 1) != model.hours.substring(0, 1)) {
      // Declare the [Interval] both [AnimatedBuilders] will use
      Interval hoursTensInterval = Interval(0.3, 1, curve: Curves.easeOutQuad);

      hoursTens = Stack(
        children: <Widget>[
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: exitKeyframes,
            interval: hoursTensInterval,
            child: Text(
              ((int.parse(model.hours.substring(0, 1)) + 6 - 1) % 6).toString(),
              style: style,
              textScaleFactor: 1,
            ),
          ),
          NumbersAnimation(
            animationController: model.clockAnimation,
            keyframes: enterKeyframes,
            interval: hoursTensInterval,
            child: Text(
              model.hours.substring(0, 1),
              style: style,
              textScaleFactor: 1,
            ),
          )
        ],
      );
      // If the animation is not playing, or there's no difference in the old and new numbers just build a simple [Text].
    } else {
      hoursTens = Text(
        model.hours.substring(0, 1),
        style: style,
        textScaleFactor: 1,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: model.utils.scaleDimentions(20)),
            child: hoursTens),
        Padding(
            padding: EdgeInsets.only(top: model.utils.scaleDimentions(40)),
            child: hoursOnes),
        SizedBox(
          width: model.utils.scaleDimentions(60),
          height: model.utils.scaleDimentions(80),
          child: Image.asset(
            'assets/images/Dots.png',
            fit: BoxFit.contain,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: model.utils.scaleDimentions(20)),
            child: minutesTens),
        Padding(
            padding: EdgeInsets.only(top: model.utils.scaleDimentions(40)),
            child: minutesOnes),
      ],
    );
  }
}
