import 'package:clock/Clock.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// Root for the clock app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventually',
      theme: null,
      home: Clock(),
      debugShowCheckedModeBanner: false,
    );
  }
}
