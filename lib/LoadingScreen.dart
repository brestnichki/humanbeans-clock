import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset('assets/images/Loading_Screen.png',
            fit: BoxFit.contain));
  }
}
