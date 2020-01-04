import 'package:clock/BranchesLayout.dart';
import 'package:flutter/material.dart';

class LayersLayout extends StatelessWidget {
  final String minutes;
  final String seconds;
  final TextStyle _secondsStyle = TextStyle(
      fontSize: 24,
      color: Color.fromRGBO(217, 136, 136, 1)
  );

  final TextStyle _minutesStyle = TextStyle(
      fontSize: 36,
      color: Color.fromRGBO(217, 136, 136, 1)
  );

  LayersLayout({Key key, this.minutes, this.seconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Stack(
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(14, 39, 88, 1),
                  constraints: BoxConstraints.expand(),
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: minutes,
                                  style: _minutesStyle
                              ),
                              TextSpan(
                                  text: ":",
                                  style: _minutesStyle
                              ),
                              TextSpan(
                                  text: seconds,
                                  style: _secondsStyle
                              )
                            ]
                        )
                    ),
                  ),
                ),
                BranchesLayout(),
                Container(
                  constraints: BoxConstraints.expand(),
                  child: Image.asset(
                    'assets/images/texture.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ]
          ),
        ]
    );
  }
}
