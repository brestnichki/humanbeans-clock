import 'package:clock/SceneLayout.dart';
import 'package:flutter/cupertino.dart';

class AnimationsInheritedWidget extends InheritedWidget{
  final AnimationController idleAnimationsController;

  AnimationsInheritedWidget({ Key key, this.idleAnimationsController, Widget child }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AnimationsInheritedWidget oldWidget) {
    return oldWidget.idleAnimationsController.value != this.idleAnimationsController.value;
  }
  
  static AnimationsInheritedWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(AnimationsInheritedWidget);
  }
}