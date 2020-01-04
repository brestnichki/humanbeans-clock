import 'dart:async';
import 'package:clock/AnimationsInheritedWidget.dart';
import 'package:clock/ImagesInheritedWidget.dart';
import 'package:clock/SceneLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class HumanbeansClock extends StatefulWidget {

  @override
  _HumanbeansClockState createState() => _HumanbeansClockState();
}

class _HumanbeansClockState extends State<HumanbeansClock> with TickerProviderStateMixin{
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  Future<ui.FrameInfo> _birdHaloFuture;
  AnimationController _idleAnimationController;
  AnimationController _activeAnimationController;



  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _birdHaloFuture = _loadImage(
      AssetBundleImageKey(
        name: "assets/images/Pngs_Flat_0003_Bird_Shine_Color_Dodge.png",
        bundle: DefaultAssetBundle.of(context),
        scale: 1
      )
    );

    _idleAnimationController = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    )
      ..forward()
      ..addStatusListener(idleAnimation);

    _activeAnimationController = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    );

    _idleAnimationController.forward();

    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _idleAnimationController?.dispose();
    _activeAnimationController?.dispose();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  void idleAnimation(status){
    if (status == AnimationStatus.completed) {
      _idleAnimationController.reset();
      _idleAnimationController.forward();
    }
  }

  Future<ui.FrameInfo> _loadImage(AssetBundleImageKey key) async {
    final ByteData data = await key.bundle.load(key.name);
    if (data == null)
      throw 'Unable to read data';
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    return await codec.getNextFrame();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = DateFormat('mm').format(_dateTime);
    final seconds = DateFormat('ss').format(_dateTime);
    return Center(
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: FutureBuilder(
          future: _birdHaloFuture,
          builder: (BuildContext c, AsyncSnapshot<ui.FrameInfo> snapshot){
            return ImagesInheritedWidget(
              birdHalo: snapshot?.data?.image,
              child: AnimationsInheritedWidget(
                idleAnimationsController: _idleAnimationController,
                child: SceneLayout(
                  imagesLoaded: snapshot.connectionState == ConnectionState.done,
                  minutes: minutes,
                  seconds: seconds,
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
