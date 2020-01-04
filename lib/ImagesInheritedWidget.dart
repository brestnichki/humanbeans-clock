import 'dart:ui';
import 'package:flutter/material.dart' hide Image;

class ImagesInheritedWidget extends InheritedWidget {
  final Image birdHalo;

  ImagesInheritedWidget({ Key key, this.birdHalo, @required Widget child }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ImagesInheritedWidget oldWidget) {
    return false; 
  }

  static ImagesInheritedWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ImagesInheritedWidget);
  }
}