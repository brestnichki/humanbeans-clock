import 'package:flutter/material.dart';

double calculateRatio(context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  double biggerSize = width > height ? width : height;

  return biggerSize / 800;
}

class Utils {
  final ratio;

  Utils({BuildContext context}) :
      ratio = calculateRatio(context);

  double scaleDimentions(double size){
    return size * this.ratio;
  }
}