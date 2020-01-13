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
import 'ClockUiInheritedModel.dart';
import 'dart:ui' as ui;

class Clock extends StatefulWidget {

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin{
  DateTime _dateTime;
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
      playNext: (){
        _birdControls.play(_birdAnimations.getFlyOut());
        _haloControls.play(_birdAnimations.getFlyOut());
      },
      onEnd: (){
        _idleAnimation.reset();
        _idleAnimation.addStatusListener(_idleAnimationListener);
        _idleAnimation.forward().orCancel;
      }
    );
    _haloControls = FlareControls();

    _idleAnimation.addStatusListener(_idleAnimationListener);
    _idleAnimation.forward();

    _updateTime();
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

      if(_dateTime.second % 20 == 0){
//        _activeAnimation.reset();
//        _activeAnimation.forward().orCancel;
//        _activeAnimationWidgetIndex = Random().nextInt(18);

        _idleAnimation.removeStatusListener(_idleAnimationListener);
        _idleAnimation.addStatusListener(_birdAnimationListener);
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

  void _birdAnimationListener(status){
    if(status == AnimationStatus.completed){
      _idleAnimation.removeStatusListener(_birdAnimationListener);
      _birdControls.play(_birdAnimations.getFlyIn());
      _haloControls.play(_birdAnimations.getFlyIn());
    }
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