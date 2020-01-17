import 'package:clock/BottomLeftBranch.dart';
import 'package:clock/BottomRightBranch.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/ClockCounter.dart';
import 'package:clock/TopLeftBranch.dart';
import 'package:clock/TopRightBranch.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class BranchesLayout extends StatelessWidget{

  const BranchesLayout({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children: <Widget> [
          const Positioned(
            top: 0,
            left: -1,
            child: const TopLeftBranch(),
          ),
          const Positioned(
            top: 0,
            right: -1,
            child: const TopRightBranch(),
          ),
          Center(
            child: ClockCounter()
          ),
          const Positioned(
            bottom: 0,
            left: -1,
            child: const BottomLeftBranch()
          ),
          FlareActor(
          'assets/rive/Bird_Final_2.flr',
          controller: ClockUiInheritedModel.of(context, 'birdControls').birdControls,
          fit: BoxFit.contain,
          shouldClip: false,
          ),
          const Positioned(
            bottom: 0,
            right: -1,
            child: const BottomRightBranch(),
          )
      ]
    );
  }
}
