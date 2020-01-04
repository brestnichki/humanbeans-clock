import 'package:clock/BirdAnimation.dart';
import 'package:flutter/material.dart' hide Image;
import 'LayersLayout.dart';

class SceneLayout extends StatefulWidget {
  final bool imagesLoaded;
  final String minutes;
  final String seconds;

  SceneLayout({ this.imagesLoaded, this.minutes, this.seconds});

  @override
  _SceneLayoutState createState() => _SceneLayoutState();
}

class _SceneLayoutState extends State<SceneLayout> with SingleTickerProviderStateMixin{
  AnimationController _birdAnimation;

  @override
  void initState() {
    super.initState();
    _birdAnimation = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.imagesLoaded){
      return BirdAnimation(
        animationController: _birdAnimation,
        child: LayersLayout(
            minutes: widget.minutes,
            seconds: widget.seconds
        ),
      );
    } else {
      return LayersLayout(
          minutes: widget.minutes,
          seconds: widget.seconds
      );
    }
  }
}
