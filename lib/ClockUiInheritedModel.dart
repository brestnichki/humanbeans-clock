import 'dart:ui';

import 'package:clock/BirdController.dart';
import 'package:clock/Utils.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart' hide Image;

// The model that holds all the values that the Widgets need to access

class ClockUiInheritedModel extends InheritedModel<String> {
  // The time values that are going to change during the app life
  final String hours;
  final String minutes;

  final String prevHours;
  final String prevMinutes;

  // The [AnimationController] values that are the same during all the time
  final AnimationController idleAnimation;
  final AnimationController activeAnimation;

  // The index of the [Leaf] widget that's the [_activeController] animation is going to play on.
  //
  // It's used to notify the widget to rebuild with the [AnimationController] that's going to play
  // the animation.
  final int activeAnimationWidgetIndex;

  // [Utils] class used by all the widgets that have fixed dimentions to scale them to the screen.
  final Utils utils;

  // The Future that the app uses to wait for the texture images to load.
  final Future<List<Image>> imagesFuture;

  // The controllers for the flare animations.
  final BirdController birdControls;
  final FlareControls haloControls;

  // List populated with the indexes of all the [Leaf] widgets. It's unchanged during the app life.
  final leavesIndexes = List<int>.generate(19, (i) => i);

  // The animation controller for the [ClockCounter] widget. It's unchanged during the app life.
  final AnimationController clockAnimation;

  ClockUiInheritedModel(
      {Key key,
      this.hours,
      this.minutes,
      this.prevHours,
      this.prevMinutes,
      this.idleAnimation,
      this.activeAnimation,
      this.activeAnimationWidgetIndex,
      this.utils,
      this.imagesFuture,
      this.birdControls,
      this.haloControls,
      this.clockAnimation,
      Widget child})
      : assert(hours != null),
        assert(minutes != null),
        assert(prevHours != null),
        assert(prevMinutes != null),
        assert(idleAnimation != null),
        assert(activeAnimation != null),
        assert(activeAnimationWidgetIndex != null),
        assert(utils != null),
        assert(birdControls != null),
        assert(haloControls != null),
        assert(clockAnimation != null),
        super(key: key, child: child);

  // Only notify the widgets when [this.hours], [this.minutes], [this.utils.ratio] or [this.activeAniamtionWidgetInex] chages.
  @override
  bool updateShouldNotify(ClockUiInheritedModel old) {
    return this.hours != old.hours ||
        this.minutes != old.minutes ||
        this.utils.ratio != old.utils.ratio ||
        this.activeAnimationWidgetIndex != old.activeAnimationWidgetIndex;
  }

  // Only notify the widgets that are subscribed to the 'hours' and 'minutes', 'size' or one of the generated [Leaf] indexes aspects.
  @override
  bool updateShouldNotifyDependent(
      ClockUiInheritedModel old, Set<String> aspects) {
    return
        // if the [this.hours] has changed and the widget it's subscribed to 'hours' aspects.
        (this.hours != old.hours && aspects.contains('hours')) ||
            // if the [this.minutes] has changed and the widget it's subscribed to 'minutes' aspects.
            (this.minutes != old.hours && aspects.contains('minutes')) ||
            // if the [this.utils.ratio] changes and the widget is's subscirbed to 'size'.
            (this.utils.ratio != old.utils.ratio && aspects.contains('size')) ||
            // Generates separate aspects for all the [Leaf] widgets and chooses to notify them.
            //
            // It compares one by one if the [this.activeAimationWidtgetIndex' corresponds to the
            // personal aspect to the [Leaf] widget.
            // It does it for the new [ClockUIInheritedModel] and the old one so only the [Leaf]
            // that's going to play the [activeAniamation] and the one that played it last iteration
            // rebuild.
            leavesIndexes
                .any((index) => checkForLeafUpdate(index, old, aspects));
  }

  // Static method to get hold off the widget form child context.
  static ClockUiInheritedModel of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<ClockUiInheritedModel>(context,
        aspect: aspect);
  }

  bool checkForLeafUpdate(
      int index, ClockUiInheritedModel old, Set<String> aspects) {
    return
        // Rebuild only if [this.activeAnimationWidgetIndex] has changed.
        //
        // If the index is the same, the [Leaf] all ready has the [AnimatedBuilder] to play the animation.
        this.activeAnimationWidgetIndex != old.activeAnimationWidgetIndex &&
            // Only notify the widgets that have aspect in the model 'activeAniamtionIndex'+index.
            //
            // The aspect is set manualy for all the [Leaf] widgets.
            ((this.activeAnimationWidgetIndex == index &&
                    aspects.contains('activeAnimationIndex$index')) ||
                old.activeAnimationWidgetIndex == index &&
                    aspects.contains('activeAnimationIndex$index'));
  }
}
