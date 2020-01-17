import 'dart:math';

import 'package:flare_flutter/flare_controls.dart';

class BirdAnimations {
  final String _flyInAnimation = "Flying_in";
  final String _flyOutAnimation = 'Flying_Away';

  final List<Map<String, dynamic>> _transitAnimations = [
    {
      "name" : 'Nap',
      "duration": 20000
    },
    {
      "name" : 'Grooming',
      "duration": 3150
    },
    {
      "name" : 'Wing_span',
      "duration": 1520
    },
    {
      "name" : 'Wings_Move',
      "duration": 2400
    },
    {
      "name" : 'Head_move',
      "duration": 4130
    }
  ];

  String getFlyIn() {
    return _flyInAnimation;
  }

  String getFlyOut() {
    return _flyOutAnimation;
  }

  String getRandom(int timeLeft) {
    List<Map<String, dynamic>> possibleAnimations =
      _transitAnimations.where((element) => element['duration'] < timeLeft).toList();

    if(possibleAnimations.length == 0){
      return null;
    }

    return possibleAnimations[Random().nextInt(possibleAnimations.length)]['name'];
  }
}