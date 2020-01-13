import 'dart:async';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'ClockUiInheritedModel.dart';
import 'dart:ui' as ui;

class Clock extends StatefulWidget {

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin{
  DateTime _dateTime;
  DateTime _birdTime;
  Timer _timer;
  Future<List<Image>> _imagesFuture;

  AnimationController _idleAnimation;
  AnimationController _activeAnimation;


  AnimationController _birdAnimation;
  FlareControls _birdControls;
  BirdAnimations _birdAnimations = BirdAnimations();

  FlareControls _haloControls;


  Utils _utils;

  int _activeAnimationWidgetIndex = -1;


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _idleAnimation = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this
    );

    _activeAnimation = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    );

    _birdAnimation = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    );

    _birdControls = BirdController(
      onAnimationEnd: _birdAnimationListener
    );
    _haloControls = FlareControls();

    _idleAnimation.addStatusListener(_idleAnimationListener);
    _idleAnimation.forward().orCancel;

    _updateTime();
    _getBirdTime();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _utils = Utils(context: context);

    _imagesFuture ??= Future.wait([
      _loadImage(
          AssetBundleImageKey(
              name: "assets/images/Pngs_Flat_0003_Bird_Shine_Color_Dodge.png",
              bundle: DefaultAssetBundle.of(context),
              scale: _utils.scaleDimentions(1)
          )
      ),
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
    _idleAnimation?.dispose();
    _activeAnimation?.dispose();
    _birdAnimation?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime(){
    setState(() {
      _dateTime = DateTime.now();


      print(_birdTime);

      if(_birdTime != null && _dateTime.isAfter(_birdTime) && _dateTime.second == 0){
        _idleAnimation.removeStatusListener(_idleAnimationListener);
        _idleAnimation.addStatusListener(_lastIdleAnimationListener);
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
      _setBirdTime();
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
      String nextAnimationName = _birdAnimations.getRandom(30 - _dateTime.second);
      print(nextAnimationName);

      if(nextAnimationName != null){
        _birdControls.play(nextAnimationName);
      } else {
        _birdControls.play(_birdAnimations.getFlyOut());
        _haloControls.play(_birdAnimations.getFlyOut());
      }
    }
  }

  void _getBirdTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int birdTimeMillis = prefs.getInt('birdTimeInMill');
    if(birdTimeMillis != null &&
        DateTime.now().isBefore(DateTime.fromMillisecondsSinceEpoch(birdTimeMillis))){
      _birdTime = DateTime.fromMillisecondsSinceEpoch(birdTimeMillis);
    } else {
      await _setBirdTime();
      _getBirdTime();
    }
  }

  void _setBirdTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();

    DateTime nextBirdTime = DateTime(now.year, now.month, now.day, now.hour, now.minute)
      ..add(Duration(minutes: 1));


//
//    DateTime nextBirdTime = DateTime(now.year, now.month, now.day)
//      ..add(Duration(days: 1))
//      ..add(Duration(hours: Random().nextInt(23)))
//      ..add(Duration(minutes: Random().nextInt(60)));

    prefs.setInt('birdTimeInMill', nextBirdTime.millisecondsSinceEpoch);
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

    return
      ClockUiInheritedModel(
        minutes: minutes,
        seconds: seconds,
        idleAnimation: _idleAnimation,
        activeAnimation: _activeAnimation,
        activeAnimationWidgetIndex: _activeAnimationWidgetIndex,
        imagesFuture: _imagesFuture,
        birdControls: _birdControls,
        haloControls: _haloControls,
        utils: _utils,
        child: const SceneLayout(),
      );
  }
}