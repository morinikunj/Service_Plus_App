import 'package:flutter/material.dart';

class AppColors {
  //private constructors
  AppColors._();

  // App Basic Color

  static Color primaryColor = const Color.fromRGBO(16, 187, 241, 1);
  static Color secondaryColor = const Color.fromRGBO(23, 25, 81, 1);
  static Color yellowColor = const Color.fromRGBO(252, 194, 49, 1);
  // static Color greyColor = const Color(0x00686060);
  static Color accentColor = const Color.fromARGB(255, 250, 249, 249);

  //  Gradient Colors
  static Color primaryGredientColor = const Color.fromRGBO(175, 234, 252, 1);

  // Text Colors
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color greyColor = Colors.grey;
  static Color greyColor1 = Colors.black.withOpacity(0.15);

  //Background Colors
  static Color greenColor = Colors.green;
  static Color chatBubbleColor = const Color(0xffE7E7ED);

  //Error Color
  static Color redColor = Colors.red;

  //Icon Button Color
  static Color iconButtonColor = Colors.black.withOpacity(0.5);
}
