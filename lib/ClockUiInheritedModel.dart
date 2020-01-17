import 'dart:ui';

import 'package:clock/Utils.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart' hide Image;

class ClockUiInheritedModel extends InheritedModel<String>{

  final String minutes;
  final String seconds;

  final String prevMinutes;
  final String prevSeconds;

  final AnimationController idleAnimation;
  final AnimationController activeAnimation;
  final AnimationController birdAnimation;

  final int activeAnimationWidgetIndex;

  final Utils utils;

  final Future<List<Image>> imagesFuture;

  final FlareControls birdControls;
  final FlareControls haloControls;

  final leavesIndexes =  List<int>.generate(19, (i) => i);

  final AnimationController clockAnimation;

  ClockUiInheritedModel({
    Key key,
    this.minutes,
    this.seconds,
    this.prevMinutes,
    this.prevSeconds,
    this.idleAnimation,
    this.activeAnimation,
    this.activeAnimationWidgetIndex,
    this.birdAnimation,
    this.utils,
    this.imagesFuture,
    this.birdControls,
    this.haloControls,
    this.clockAnimation,
    Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ClockUiInheritedModel old) {
    return this.minutes != old.minutes ||
            this.seconds != old.seconds ||
            this.utils.ratio != old.utils.ratio ||
            this.activeAnimationWidgetIndex != old.activeAnimationWidgetIndex;
  }

  @override
  bool updateShouldNotifyDependent(ClockUiInheritedModel old, Set<String> aspects) {
    return (this.minutes != old.minutes && aspects.contains('miniutes')) ||
            (this.seconds != old.seconds && aspects.contains('seconds')) ||
            (this.utils.ratio != old.utils.ratio && aspects.contains('size')) ||
            leavesIndexes.any((index) => checkForLeafUpdate(index, old, aspects));
  }

  static ClockUiInheritedModel of(BuildContext context, String aspect){
    return InheritedModel.inheritFrom<ClockUiInheritedModel>(context, aspect: aspect);
  }

  bool checkForLeafUpdate(int index, ClockUiInheritedModel old, Set<String>aspects){
    return this.activeAnimationWidgetIndex != old.activeAnimationWidgetIndex && (
              (this.activeAnimationWidgetIndex == index && aspects.contains('activeAnimationIndex$index')) ||
              old.activeAnimationWidgetIndex == index && aspects.contains('activeAnimationIndex$index')
          );
  }

}