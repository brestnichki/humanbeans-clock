import 'package:clock/BottomLeftBranch.dart';
import 'package:clock/BottomRightBranch.dart';
import 'package:clock/TopFeftBranch.dart';
import 'package:flutter/material.dart';
import 'package:supernova_flutter_ui_toolkit/keyframes.dart';

import 'BranchAnimation.dart';
import 'LeafAnimation.dart';

class BranchesLayout extends StatefulWidget {
  @override
  _BranchesLayoutState createState() => _BranchesLayoutState();
}

class _BranchesLayoutState extends State<BranchesLayout> with TickerProviderStateMixin{

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
    _idleAnimationController?.dispose();
    _activeAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget> [
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomLeftBranch()
          ),
          Positioned(
            top: 0,
            left: 0,
            child: TopLeftBranch(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: BottomRightBranch(),
          )
      ]
    );
  }
}
