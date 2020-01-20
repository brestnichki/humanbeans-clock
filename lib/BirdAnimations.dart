import 'dart:math';

// Class that holds the values for the [_birdControl] animations and provides functionality to choose random animaiton.
//
// The class has methods to return the enter and exit animations as well as one that choses
// animation from the list of animations that can fit in in a time frame.
class BirdAnimations {
  // The hame of the enter animation.
  final String _flyInAnimation = "Flying_in";
  // The name of the exit animation.
  final String _flyOutAnimation = 'Flying_Away';

  // List with the the rest of the animations that are going to play a random.
  //
  // The durations of the animations are given in milliseconds.
  final List<Map<String, dynamic>> _transitAnimations = [
    {"name": 'Nap', "duration": 20000},
    {"name": 'Grooming', "duration": 3150},
    {"name": 'Wing_span', "duration": 1520},
    {"name": 'Wings_Move', "duration": 2400},
    {"name": 'Head_move', "duration": 4130}
  ];

  // Get the name of the enter animation.
  String getFlyIn() {
    return _flyInAnimation;
  }

  // Get the name of the exit animation.
  String getFlyOut() {
    return _flyOutAnimation;
  }

  // Get the name of a random animation that can fit in the [timeLeft] argument.
  //
  // If there's no animations that can fit, return null.
  String getRandom(int timeLeft) {
    // Filter the animatons on animation duration < [timeLeft] argument.
    List<Map<String, dynamic>> possibleAnimations = _transitAnimations
        .where((element) => element['duration'] < timeLeft)
        .toList();

    if (possibleAnimations.length == 0) {
      return null;
    }

    // Return random animation form the filtered list
    return possibleAnimations[Random().nextInt(possibleAnimations.length)]
        ['name'];
  }
}
