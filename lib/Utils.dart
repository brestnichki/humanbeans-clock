import 'package:flutter/material.dart';

double calculateRatio(context){
  Size size = MediaQuery.of(context).size;

  double smallerSize = size.width < size.height ? size.width : size.height;

  return (smallerSize / 3 * 5) / 800;
}

class Utils {
  final ratio;

  Utils({BuildContext context}) :
      ratio = calculateRatio(context);

  double scaleDimentions(double size){
    return size * this.ratio;
  }
}