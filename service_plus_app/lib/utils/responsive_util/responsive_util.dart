import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsiveUtil extends ChangeNotifier {

  // Singleton instance
  static final ResponsiveUtil _instance = ResponsiveUtil._();

  static ResponsiveUtil get instance => _instance;
  
  // Private constructor
  ResponsiveUtil._();

  static late double screenWidth;
  static late double screenHeight;
  static double defaultWidth = 360;
  static double defaultHeight = 800;
  static late Orientation orientation;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    notifyListeners();
  }

  //height
  static double height(double height, context) {
    screenHeight = MediaQuery.of(context).size.height;
    return (height / defaultHeight) * screenHeight;
  }

  //width
 static double width(double width, context) {
    screenWidth = MediaQuery.of(context).size.width;
    return (width / defaultWidth) * screenWidth;
  }

  double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
