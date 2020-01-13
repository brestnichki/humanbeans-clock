import 'package:clock/BranchesLayout.dart';
import 'package:clock/ClockUiInheritedModel.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LayersLayout extends StatelessWidget {
  static const TextStyle _secondsStyle = const TextStyle(
      fontSize: 24,
      color: Color.fromRGBO(217, 136, 136, 1)
  );

  static const TextStyle _minutesStyle = const TextStyle(
      fontSize: 36,
      color: Color.fromRGBO(217, 136, 136, 1)
  );

  const LayersLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            color: const Color.fromRGBO(14, 39, 88, 1),
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: ClockUiInheritedModel.of(context, 'minutes').minutes,
                            style: _minutesStyle
                        ),
                        const TextSpan(
                            text: ":",
                            style: _minutesStyle
                        ),
                        TextSpan(
                            text: ClockUiInheritedModel.of(context, 'seconds').seconds,
                            style: _secondsStyle
                        )
                      ]
                  )
              ),
            ),
          ),
          const BranchesLayout(),
          FlareActor(
            'assets/rive/Light_Final.flr',
            controller: ClockUiInheritedModel.of(context, 'birdControls').haloControls,
            fit: BoxFit.contain,
            shouldClip: true,
          ),
        ]
    );
  }
}
