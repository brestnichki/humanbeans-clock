import 'dart:math';

import 'package:flare_flutter/flare_controls.dart';

class BirdAnimations {
  final String _flyInAnimation = "Flying_in";
  final String _flyOutAnimation = 'Flying_Away';

  final List<Map<String, dynamic>> _transitAnimations = [
    {
      "name" : 'Nap',
      "duration": 10
    },
    {
      "name" : 'Grooming',
      "duration": 10
    },
    {
      "name" : 'Wing_span',
      "duration": 10
    },
    {
      "name" : 'Wings_Move',
      "duration": 10
    },
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