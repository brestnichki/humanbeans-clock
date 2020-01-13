import 'package:clock/BottomLeftBranch.dart';
import 'package:clock/BottomRightBranch.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:clock/TopLeftBranch.dart';
import 'package:clock/TopRightBranch.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class BranchesLayout extends StatelessWidget{

  const BranchesLayout({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget> [
          Positioned(
            top: 0,
            left: 0,
            child: TopLeftBranch(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: TopRightBranch(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomLeftBranch()
          ),
          FlareActor(
          'assets/rive/Bird_Final_2.flr',
          controller: ClockUiInheritedModel.of(context, 'birdControls').birdControls,
          fit: BoxFit.contain,
          shouldClip: false,
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
