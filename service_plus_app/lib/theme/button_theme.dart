import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';

class AppButtonTheme {
  //light
  static final elevatedButtonLightTheme = ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
    backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
    elevation: const MaterialStatePropertyAll(0),
    foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
  ));

  static const textButtonLightTheme = TextButtonThemeData(
    style: ButtonStyle()
  );
}
