import 'package:clock/BranchesLayout.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LayersLayout extends StatelessWidget {

  const LayersLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(14, 39, 88, 1),
      constraints: const BoxConstraints.expand(),
      child: Stack(
          children: <Widget>[
            const BranchesLayout(),
            FlareActor(
              'assets/rive/Light_Final.flr',
              controller: ClockUiInheritedModel.of(context, 'birdControls').haloControls,
              fit: BoxFit.contain,
              shouldClip: true,
            ),
          ]
      ),
    );
  }
}
