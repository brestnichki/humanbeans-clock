import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:clock/BirdAnimations.dart';
import 'package:clock/BirdController.dart';
import 'package:clock/SceneLayout.dart';
import 'package:clock/Utils.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'ClockUiInheritedModel.dart';
import 'dart:ui' as ui;


// Widget that does time tracking and orchestrating of data and animations.
//
// The widget keeps track of time for the watch.
// It starts and stops the animations that move the rest of the widgets.
// All the data is shared to the rest of the three using InheritedModel.
class Clock extends StatefulWidget {

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin{
  /// The current time for the watch
  DateTime _dateTime;
  // The time during the previous render
  //
  // On first render it's set to the value of [_dateTime] then on each rerender
  // it's set to the vale of [_dateTime] before it's reasigned to current time.
  // It's used to track which numbers of the clock counter shoud change on each clock
  // counter animation play;
  DateTime _prevTime;

  // The time when the bird animation will play
  //
  // The value is persisted in the file system and it's gets red from there on
  // each initState call
  // The bird animation will play on the first render for which the [_dateTime] is
  // after the bird time
  DateTime _birdTime;

  // Timer that executes callback on a given interval
  //
  // The callback calls [setState] for the [Clock] widget that triggers all the changes
  // in the app.
  Timer _timer;

  // List of Futures that resolves when [dart:ui.Images] the texture effect used in the
  // clock.
  //
  // The app renders loading screen before the images load and the clock after that.
  Future<List<Image>> _imagesFuture;

  // Animation controller for the looping animation playng most of the time on the clock.
  //
  // The value of the animation is used by the leaves and branches images to animate the
  // "wind" effect.
  AnimationController _idleAnimation;

  // Animation controller for the leaves "flying off" the branches.
  //
  // The animation plays during the minute change and does not loop
  AnimationController _activeAnimation;

  // Controller to play the bird animations.
  //
  // The BirdController extends FlareController and overrides @onComplete method,
  // to expose it to the current class. This allows us to keep all the animation
  // orchestrating in this widget.
  BirdController _birdControls;

  // Controller to play the bird halo animations
  //
  // The bird and halo animations play at the same time and the halo should be
  // over the bird, but the halo [FlareActor] should be over the rest of the
  // elements in the app and it's separated because of that.
  FlareControls _haloControls;

  // Custom class holding all the animations and animation durations for the bird [FlareActor].
  //
  // It's impelented as a class to provide functionality to show random animation from the list depending on how much time the bird
  // has to stay on the screen.
  BirdAnimations _birdAnimations = BirdAnimations();

  // Timer providing pause between the bird animations
  Timer _birdTimer;

  // Animation controller for the clock counter widget.
  //
  // Plays the animation for changing the numbers on the clock counter. Its'
  // triggered every time the clock nimbers need to change
  AnimationController _clockAnimation;

  // Utils class that provide scaling for all elements on the screem
  //
  // The class calculates the ratio of the current device in comparison to
  // a 480x800 dp device that was the base for the design. The ratio it's
  // used to scale all the elements on the screen.
  Utils _utils;

  // Index that designates which element the "Flighing off" animation should play on.
  //
  // All of the leaves on the screen are controlled by one [AnimationController].
  // When a leaf has to fligh of the index is chosen on random and the animation plays
  // only for that widget. The rest are suppressed by flag on the widget.
  int _activeAnimationWidgetIndex = -1;


  @override
  void initState() {
    // Instruct the operating system we want landscape orientaion.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Initiating the looping animation that plays most of the time.
    _idleAnimation = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this
    );

    // Initiating the "Flyiging off" animation.
    _activeAnimation = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    );


    // Initiating the [ClockCounter] animation.
    _clockAnimation = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this
    );

    // Initiating [_birdControls]
    //
    // The value of [_birdAnimationListener] is a callback that gets called
    // each time one of the animations of the [FlareActor] ends. We use the
    // callback to check the current time and deside what animations to play.
    _birdControls = BirdController(
      onAnimationEnd: _birdAnimationListener
    );

    // Initializing [_haloControls]
    _haloControls = FlareControls();

    // Adding [AnimationStatusListener] to the "Idle Animation".
    //
    // The status listener executes code on the animations end. It loops the
    // animation explicitly every time so when we want to end it on the next
    // [AnimationStatus.Completed] we can.
    // TODO: Change implementation without the explicit looping
    _idleAnimation.addStatusListener(_idleAnimationListener);

    // Start the "Idle Animation"
    _idleAnimation.forward().orCancel;

    // Start the clock loop.
    _updateTime();

    // Read the value of the persisted time when the bird animation needs to paly
    _getBirdTime();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize the [_utils] variable
    //
    // It's initialized in didChangeDependancies to give us access to the
    // MediaQuery.of() to measure the screen and calculate the ratio to the
    // "ideal screen"
    // The idea is for the [_utils] variable to get reasigned if something
    // changed in the app. Orientation for instance? Screen in screen feature?
    _utils = Utils(context: context);

    // Initialize the [_imagesFuture].
    //
    // It's initialized here to give us access to the [DefaultAssetBundle].
    // It does not get reasigned when dependancies change.
    // The future waits for the two texture files to load and then resolves.
    // TODO: Reasign on dependancies change?
    _imagesFuture ??= Future.wait([
      _loadImage(
          AssetBundleImageKey(
              name: "assets/images/Pngs_Flat_0001_Texture_Screen.png",
              bundle: DefaultAssetBundle.of(context),
              scale: _utils.scaleDimentions(1)
          )
      ),
      _loadImage(
          AssetBundleImageKey(
              name: "assets/images/Pngs_Flat_0002_Texture_Multiply.png",
              bundle: DefaultAssetBundle.of(context),
              scale: _utils.scaleDimentions(1)
          )
      )
    ]);
  }


  @override
  void dispose() {
    super.dispose();
    // Dispose of animation controllers if initialized.
    _idleAnimation?.dispose();
    _activeAnimation?.dispose();
    _clockAnimation?.dispose();

    // Dispose of timers if initialzied.
    _timer?.cancel();
    _birdTimer?.cancel();
    super.dispose();
  }

  void _updateTime(){
    // Triggers rerender for the entire app to reflect the changes in time
    setState(() {
      // Assign [_prevTime] the previous value of [_dateTime] or the current time
      // f it's first render.
      //
      // The value of [_prevTime] it's used for the [ClockCounter] numbers animations
      // so the first animation will not play for the numbers there in no case.
      // It's important do be done before [_dateTime] it's reasigned.
      _prevTime = _dateTime ?? DateTime.now();

      // Assing [_date_Time] to current time
      _dateTime = DateTime.now();

      // Reset and play the animation for the [ClockCounter] numbers.
      _clockAnimation.reset();
      _clockAnimation.forward().orCancel;

      // If the [_getBirdTime()] Future has returned and [_birdTime] has value check if the [_dateTime] (current time)
      // is after [_birdTime] (the time the bird animation) is scheduled and if its round minute
      //
      // If the bird time gets
      if(_birdTime != null &&
          _dateTime.isAfter(_birdTime) &&
          _dateTime.second == 0 ){
        _idleAnimation.removeStatusListener(_idleAnimationListener);
        _idleAnimation.addStatusListener(_lastIdleAnimationListener);
      } else if(_dateTime.second % 10 == 0){
        _activeAnimationWidgetIndex = Random().nextInt(19);
        _activeAnimation.reset();
        _activeAnimation.forward().orCancel;
      }

       _timer = Timer(
         Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
         _updateTime,
       );
    });
  }

  void _idleAnimationListener(status){
    if(status == AnimationStatus.completed){
      _idleAnimation.reset();
      _idleAnimation.forward().orCancel;
    }
  }

  void _lastIdleAnimationListener(status){
    if(status == AnimationStatus.completed){
      _idleAnimation.removeStatusListener(_lastIdleAnimationListener);
      _birdControls.play(_birdAnimations.getFlyIn());
      _haloControls.play(_birdAnimations.getFlyIn());
    }
  }

  void _birdAnimationListener(name){
    if(name == _birdAnimations.getFlyOut()) {
      _idleAnimation.reset();
      _idleAnimation.addStatusListener(_idleAnimationListener);
      _idleAnimation
          .forward()
          .orCancel;
    } else {
      String nextAnimationName = _birdAnimations.getRandom(55000 + _birdTime.millisecondsSinceEpoch  - _dateTime.millisecondsSinceEpoch);

      if(nextAnimationName != null){
        _birdTimer = Timer(
          Duration(seconds: 2),
          () => _birdControls.play(nextAnimationName)
        );
      } else {
        _birdControls.play(_birdAnimations.getFlyOut());
        _haloControls.play(_birdAnimations.getFlyOut());
        _setBirdTime().then((birdTime) => _birdTime = birdTime);
      }
    }
  }

  void _getBirdTime() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/birdTime.txt');
      String birdTime = await file.readAsString();
      int birdTimeMillis = int.parse(birdTime);

      if (birdTimeMillis != null &&
          DateTime.now().isBefore(
              DateTime.fromMillisecondsSinceEpoch(birdTimeMillis))) {
        _birdTime = DateTime.fromMillisecondsSinceEpoch(birdTimeMillis);
      } else {
        _birdTime = await _setBirdTime();
      }
    } catch(e) {
      _birdTime = await _setBirdTime();
    }
  }

  Future<DateTime> _setBirdTime() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/birdTime.txt');

    DateTime now = DateTime.now();

    DateTime lastMidnightTime = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    DateTime nextBirdTime = lastMidnightTime.add(Duration(minutes: 3));

//
//    DateTime nextBirdTime = DateTime(now.year, now.month, now.day)
//      ..add(Duration(days: 1))
//      ..add(Duration(hours: Random().nextInt(23)))
//      ..add(Duration(minutes: Random().nextInt(59)));

    await file.writeAsString(nextBirdTime.millisecondsSinceEpoch.toString());

    return nextBirdTime;
  }

  void _deleteFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/birdTime.txt');

    await file.delete();
  }



  Future<Image> _loadImage(AssetBundleImageKey key) async {
    final ByteData data = await key.bundle.load(key.name);
    if (data == null)
      throw 'Unable to read data';
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    var frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  Widget build(BuildContext context) {
    final minutes = DateFormat('mm').format(_dateTime);
    final seconds = DateFormat('ss').format(_dateTime);
    final prevMinites = DateFormat("mm").format(_prevTime);
    final prevSeconds = DateFormat("ss").format(_prevTime);

    return
      ClockUiInheritedModel(
        minutes: minutes,
        seconds: seconds,
        prevMinutes: prevMinites,
        prevSeconds: prevSeconds,
        idleAnimation: _idleAnimation,
        activeAnimation: _activeAnimation,
        activeAnimationWidgetIndex: _activeAnimationWidgetIndex,
        imagesFuture: _imagesFuture,
        birdControls: _birdControls,
        haloControls: _haloControls,
        clockAnimation: _clockAnimation,
        utils: _utils,
        child: const SceneLayout(),
      );
  }
}