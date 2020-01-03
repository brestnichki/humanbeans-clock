import 'dart:async';
import 'package:clock/BranchAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

import 'LeafAnimation.dart';

class HumanbeansClock extends StatefulWidget {

  @override
  _HumanbeansClockState createState() => _HumanbeansClockState();
}

class _HumanbeansClockState extends State<HumanbeansClock> with TickerProviderStateMixin{
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  TextStyle _secondsStyle = TextStyle(
    fontSize: 24,
    color: Color.fromRGBO(217, 136, 136, 1)
  );

  TextStyle _minutesStyle = TextStyle(
    fontSize: 36,
    color: Color.fromRGBO(217, 136, 136, 1)
  );

  AnimationController _idleAnimationController;
  AnimationController _activeAnimationController;

  void idleAnimation(status){
    if (status == AnimationStatus.completed) {
      _idleAnimationController.reset();
      _idleAnimationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _updateTime();
    _idleAnimationController = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    )
      ..forward()
      ..addStatusListener(idleAnimation);

    _activeAnimationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _idleAnimationController?.dispose();
    _activeAnimationController?.dispose();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      if(_dateTime.second % 4 == 0){
        _activeAnimationController.reset();
        _activeAnimationController.forward();
      }

      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final minute = DateFormat('mm').format(_dateTime);
    final second = DateFormat('ss').format(_dateTime);

    return Center(
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Stack(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(14, 39, 88, 1),
              constraints: BoxConstraints.expand(),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: minute,
                          style: _minutesStyle
                        ),
                        TextSpan(
                          text: ":",
                          style: _minutesStyle
                        ),
                        TextSpan(
                          text: second,
                          style: _secondsStyle
                        )
                      ]
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: 320,
                height: 250,
                child: BranchAnimation(
                  animationController: _idleAnimationController,
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
                        bottom: 5,
                        left: 10,
                        child: LeafAnimation(
                          idleController: _idleAnimationController,
                          activeController: _activeAnimationController.isAnimating ? _activeAnimationController : null,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: -0.06),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(0.2, 0),
                          child: Image.asset(
                              'assets/images/leaf_1.png'
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 140,
                        left: 64,
                        child: BranchAnimation(
                          animationController: _idleAnimationController,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: -0.09),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(0.2, 1),
                          child: Image.asset(
                              'assets/images/leaf_2.png'
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 150,
                        child: BranchAnimation(
                          animationController: _idleAnimationController,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: -0.09),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(0.2, 0),
                          child: Image.asset(
                              'assets/images/leaf_3.png'
                          ),
                        ),
                      ),
                      Positioned(
                        left: 228,
                        bottom: 43,
                        child: BranchAnimation(
                          animationController: _idleAnimationController,
                          keyframes: <Keyframe<double>>[
                            Keyframe<double>(fraction: 0, value: 0),
                            Keyframe<double>(fraction: 0.9, value: -0.06),
                            Keyframe<double>(fraction: 1, value: 0)
                          ],
                          interval: Interval(0, 1, curve: Curves.easeOutQuad),
                          transformOrigin: FractionalOffset(0.2, 1),
                          child: Image.asset(
                            'assets/images/001_branch.png',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 300,
                          child: Image.asset(
                            'assets/images/000_branch.png',
                            fit: BoxFit.contain
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(),
              child: Image.asset(
                'assets/images/texture.png',
                fit: BoxFit.cover,
              ),
            )
          ]
        ),
      ),
    );
  }
}
