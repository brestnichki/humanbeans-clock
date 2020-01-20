import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
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
//
//
// The widget keeps track of time for the watch.
// It starts and stops the animations that move the rest of the widgets.
// All the data is shared to the rest of the three using InheritedModel.
// Because the this widget rebuilds on each time change it's important that
// the child of the InheritedModel is const to stop the propagination of
// the rebuild.
class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  /// The current time for the watch
  DateTime _dateTime;
  // The time during the previous render
  //
  // On first render it's set to the value of [_dateTime] then on each rebuild
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

  // Boolean to track if the app is in the foreground
  //
  // Used to disable playing animations when the app is paused, because trying to play
  // them form [Timer] callback if they're not playing will throw an exeption
  bool _appInForeground = true;

  // List of Futures that resolves when [dart:ui.Images] the texture effect used in the
  // clock.
  //
  // The app renders loading screen before the images load and the clock after that.
  Future<List<ui.Image>> _imagesFuture;

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
  // When a leaf has to fly of the index is chosen on random and the animation plays
  // only for that widget. The rest are suppressed by flag on the widget.
  int _activeAnimationWidgetIndex = -1;

  @override
  void initState() {
    super.initState();
    // Hide the status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    // Instruct the operating system we want landscape orientaion.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Initiating the looping animation that plays most of the time.
    _idleAnimation =
        AnimationController(duration: Duration(seconds: 8), vsync: this);

    // Initiating the "Flyiging off" animation.
    _activeAnimation =
        AnimationController(duration: Duration(seconds: 30), vsync: this);

    // Initiating the [ClockCounter] animation.
    _clockAnimation = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

    // Initiating [_birdControls]
    //
    // The value of [_birdAnimationListener] is a callback that gets called
    // each time one of the animations of the [FlareActor] ends. We use the
    // callback to check the current time and deside what animations to play.
    _birdControls = BirdController(onAnimationEnd: _birdAnimationListener);

    // Initializing [_haloControls]
    _haloControls = FlareControls();

    // Adding [AnimationStatusListener] to the "Idle Animation".
    //
    // The status listener executes code on the animations end. It loops the
    // animation explicitly every time so when we want to end it on the next
    // [AnimationStatus.Completed] we can.
    _idleAnimation.addStatusListener(_idleAnimationListener);

    // Start the "Idle Animation"
    _idleAnimation.forward().orCancel;

    // Start the clock loop.
    _updateTime();

    // Read the value of the persisted time when the bird animation needs to paly
    _getBirdTime();

    // Add [WidgetBindingObserver] to notify us for the App lifecycle
    WidgetsBinding.instance.addObserver(this);
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
      _loadImage(AssetBundleImageKey(
          name: "assets/images/Pngs_Flat_0001_Texture_Screen.png",
          bundle: DefaultAssetBundle.of(context),
          scale: _utils.scaleDimentions(1))),
      _loadImage(AssetBundleImageKey(
          name: "assets/images/Pngs_Flat_0002_Texture_Multiply.png",
          bundle: DefaultAssetBundle.of(context),
          scale: _utils.scaleDimentions(1)))
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

    // Dispose of [WidgetsBindingObserver]
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.paused) {
      // Remove the [_birdTime] value, so when the app is resumed,
      // there's no change, the [_birdControlls] animation starts before
      // the [_getBirdTime] Future resolves
      _birdTime = null;
      // Raise the flag not to try and play the [_activeAnimation] and [_clockAnimation] animations,
      // as they are going to throw if not finished (and they don't finish in paused app).
      _appInForeground = false;
    } else if (state == AppLifecycleState.resumed) {
      // Set the flag to allow [_activeAnimation] and [_clockAnimation] to play
      _dateTime = DateTime.now();
      _prevTime = _dateTime;
      _appInForeground = true;
      // Read [_birdTime] form the file system and assign it when the Future resolves
      _getBirdTime();
    }
  }

  void _updateTime() {
    // Triggers rebuild for the entire app to reflect the changes in time
    setState(() {
      // Assign [_prevTime] the previous value of [_dateTime] or the current time
      // f it's first render.
      //
      // The value of [_prevTime] it's used for the [ClockCounter] numbers animations
      // so the first animation will not play for the numbers there in no case.
      // It's important do be done before [_dateTime] it's reasigned.
      _prevTime = _dateTime ?? DateTime.now();

      // Assign [_date_Time] to current time
      _dateTime = DateTime.now();

      // Only play the [_clockAnimation] if app is in foregrond. Otherwise the
      // the [Ticker] gets interupted
      if (_appInForeground) {
        // Reset and play the animation for the [ClockCounter] numbers.
        _clockAnimation.reset();
        _clockAnimation.forward().orCancel;
      }

      // If the [_getBirdTime()] Future has returned and [_birdTime] has value check if the [_dateTime] (current time)
      // is after [_birdTime] (the time the bird animation) is scheduled and if its round minute
      //
      // If the bird time it's in the past, the [_getBirdTime] function calculates a new time the next day and
      // writes it in the file system and after that assigns the new value to the [_birdTime]. It's important
      // to not start the first render wit the bird animation playing.
      if (_birdTime != null && _dateTime.isAfter(_birdTime)) {
        // Removes the status listener that loops the animation and adds status listener that will play the [_birdControls] animation
        _idleAnimation.removeStatusListener(_idleAnimationListener);
        _idleAnimation.addStatusListener(_lastIdleAnimationListener);
        // Else if not's the time to play and it's round minute the bird animaion play the "Active animation" of the [_activeAnimation], the
        // leaves flying off
      } else if (_dateTime.second == 0 && _appInForeground == true) {
        // Choose a random index for the leaf that's going to fly off.
        //
        // This index is used in the [ClockUiInheritedModel] InheritedModel to notify
        // the new leaf to rebuild with the [AnimatedBuilder] wrapper.
        _activeAnimationWidgetIndex = Random().nextInt(19);
        // Play the [_activeAnimation]
        _activeAnimation.reset();
        _activeAnimation.forward().orCancel;
      }

      // Schedule the [_timer] for the next time the clock needs to update.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  // [AnimationStatusListener] that loops the animation.
  void _idleAnimationListener(status) {
    if (status == AnimationStatus.completed) {
      _idleAnimation.reset();
      _idleAnimation.forward().orCancel;
    }
  }

  // [AnimationStatusListener] that listens for the and of the [_idleAnimation] animation and plays the bird animation
  //
  // This listener is added when it's time for the [_birdControls] animtion to play and
  // removed after it gets called (the bird animation needs to play once)
  void _lastIdleAnimationListener(status) {
    if (status == AnimationStatus.completed) {
      _idleAnimation.removeStatusListener(_lastIdleAnimationListener);
      _birdControls.play(_birdAnimations.getFlyIn());
      _haloControls.play(_birdAnimations.getFlyIn());
    }
  }

  // [_birdControls] listener that get's called each time an animation ends
  //
  // It's assigned to the [_birdControls] during the init state and it's not removed.
  // We use it to check wihch animation has played and deside which to play next.
  void _birdAnimationListener(name) {
    // If the bird has flown off the screen.
    if (name == _birdAnimations.getFlyOut()) {
      // Start the [_idleAnimation] again.
      _idleAnimation.reset();
      // Add the [AnimationStatusListener] that loops the animation.
      _idleAnimation.addStatusListener(_idleAnimationListener);
      // Play the [_idleAnimation].
      _idleAnimation.forward().orCancel;
      // If any other animation has played check if there's time for the bird to play any other animation
      //
      // If there's not time, play the fly off animation
    } else {
      DateTime currentTime = DateTime.now();

      // [_birdAniamtions.getRandom] returns a random name from the list of bird animations that has duration smaller than the provided time in miliseconds
      String nextAnimationName = _birdAnimations.getRandom(
          // The bird animations should be restricted to 55 secs to leave time for the bird to fly out and to write in the file system the
          // new [_birdTime].
          // This time includes the end of the last [_idleAnimation] too.
          // This is generous period to allow for the 2 seconds delay between the animations to play, without the risk of looping the minute
          55000
              // Add the timestamp of when the bird needed to come (the bird gets delayed by the end of the last [_idleAniamtion]
              +
              _birdTime.millisecondsSinceEpoch
              // Substract the current timestamp to get how much miliseconds we have until the 55 second period the bird has
              -
              currentTime.millisecondsSinceEpoch);

      // If [_birdAniamtions.getRandom] can choose an animation (there's animations that can fit into the time frame).
      if (nextAnimationName != null) {
        // Offset the new [_birdControls] animation by 2 seconds.
        _birdTimer = Timer(
            Duration(seconds: 2), () => _birdControls.play(nextAnimationName));
        // If the [_birdAniamtions.getRandom] can't return an animation (all the animations can't fit in the time frame, the bird needs to fly off.
      } else {
        // Play the [_birdControls] and [_haloControls] animations
        _birdControls.play(_birdAnimations.getFlyOut());
        _haloControls.play(_birdAnimations.getFlyOut());
        // [_setBirdTime] calculates the new [_birdTime] and returns a Future that reslves when the time is written in the file system, then updates the [_birdTime].
        _setBirdTime().then((birdTime) => _birdTime = birdTime);
      }
    }
  }

  // Read the timestamp for the [_birdTime] form the file system and calcualte the [DateTime] and assign it to [_birdTime].
  void _getBirdTime() async {
    // If it's the app first run the document holding the timestamp is not created.
    try {
      // Get the file.
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/birdTime.txt');

      // Read the timestamp as string.
      String birdTime = await file.readAsString();

      // Parse the timestamp as integer.
      int birdTimeMillis = int.parse(birdTime);

      // If the parsed value is not null and if the time for the bird animation is not in the past (for subsequent app loads) assign the [DateTime] value to the [_birdTime].
      //
      // We check if the value is in the past because if we allow it to be, it'll play on each app start in separate days.
      if (birdTimeMillis != null &&
          DateTime.now()
              .isBefore(DateTime.fromMillisecondsSinceEpoch(birdTimeMillis))) {
        _birdTime = DateTime.fromMillisecondsSinceEpoch(birdTimeMillis);
        // If the value for the timestamp is not set, or the timestamp is in the past.
      } else {
        _birdTime = await _setBirdTime();
      }
      // If the file is not present (on first app launch).
    } catch (e) {
      _birdTime = await _setBirdTime();
    }
  }

  // Future that calculates the time for the next [_birdControls] animation and writes it in the filesystem, then resloves with the value.
  Future<DateTime> _setBirdTime() async {
    // Get the file.
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/birdTime.txt');

    // Get the current time.
    DateTime now = DateTime.now();

    // Get the last midnight.
    //
    // We'll add a full day plus random time between 0 - 23 hours and 0 - 59 minutes
    DateTime lastMidnightTime = DateTime(now.year, now.month, now.day);

    // Calculate random time during the next calendar day.
    //
    // We want to have a guarnateed one play for calendar day, to retain the
    DateTime nextBirdTime = lastMidnightTime.add(Duration(
        days: 1, hours: Random().nextInt(24), minutes: Random().nextInt(60)));

    // Write the timestamp in the file
    await file.writeAsString(nextBirdTime.millisecondsSinceEpoch.toString());

    // Resolve the Future with the value
    return nextBirdTime;
  }

  // Load the images for the texture effect from the file system
  //
  // It may take some time so it's Future, that resolves with an [dart:ui.Image]
  Future<ui.Image> _loadImage(AssetBundleImageKey key) async {
    final ByteData data = await key.bundle.load(key.name);
    if (data == null) throw 'Unable to read data';
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    var frame = await codec.getNextFrame();
    return frame.image;
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the String representations for the [_dateTime] and [_prevDateTime] values
    final hours = DateFormat('H').format(_dateTime);
    final minutes = DateFormat('mm').format(_dateTime);
    final prevHours = DateFormat("H").format(_prevTime);
    final prevMinutes = DateFormat("mm").format(_prevTime);

    // Format the [_dateTime] for screen readers
    final assessabilityTime = DateFormat("jm").format(_dateTime);

    return
        // Return the [ClockUiInheritedModel] that holds all the data for the clock
        Semantics(
      label: "Current time: $assessabilityTime}",
      child: ExcludeSemantics(
        excluding: true,
        child: ClockUiInheritedModel(
          hours: hours,
          minutes: minutes,
          prevHours: prevHours,
          prevMinutes: prevMinutes,
          idleAnimation: _idleAnimation,
          activeAnimation: _activeAnimation,
          activeAnimationWidgetIndex: _activeAnimationWidgetIndex,
          imagesFuture: _imagesFuture,
          birdControls: _birdControls,
          haloControls: _haloControls,
          clockAnimation: _clockAnimation,
          utils: _utils,
          // It's important to be const to avoid rebuilding
          child: const SceneLayout(),
        ),
      ),
    );
  }
}
