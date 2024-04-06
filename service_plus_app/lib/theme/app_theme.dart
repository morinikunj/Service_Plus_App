import 'package:flutter/material.dart';
import 'package:service_plus_app/theme/button_theme.dart';
import 'package:service_plus_app/theme/text_theme.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    textTheme: AppTextTheme.textLightTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonLightTheme,
    textButtonTheme: AppButtonTheme.textButtonLightTheme
  );

  static ThemeData darkTheme = ThemeData.dark(

  );
}

