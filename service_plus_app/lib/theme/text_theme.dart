import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';

class AppTextTheme {
  //light mode
  static final textLightTheme = ThemeData.light().textTheme.copyWith(
        headlineLarge: ThemeData.light()
            .textTheme
            .copyWith()
            .headlineLarge!
            .copyWith(
                fontSize: GeneralSize.textsize1,
                fontWeight: GeneralSize.boldfont),
        headlineMedium: ThemeData.light()
            .textTheme
            .copyWith()
            .headlineMedium!
            .copyWith(
                fontSize: GeneralSize.textsize2,
                fontWeight: GeneralSize.boldfont),
        headlineSmall: ThemeData.light()
            .textTheme
            .copyWith()
            .headlineSmall!
            .copyWith(
                fontSize: GeneralSize.textsize3,
                fontWeight: GeneralSize.boldfont),
        titleLarge: ThemeData.light().textTheme.copyWith().titleLarge!.copyWith(
            fontSize: GeneralSize.textsize4, fontWeight: GeneralSize.boldfont),
        titleMedium: ThemeData.light()
            .textTheme
            .copyWith()
            .titleMedium!
            .copyWith(
                fontSize: GeneralSize.textsize5,
                fontWeight: GeneralSize.boldfont),
        titleSmall: ThemeData.light().textTheme.copyWith().titleSmall!.copyWith(
            fontSize: GeneralSize.textsize6, fontWeight: GeneralSize.boldfont),
        labelSmall: ThemeData.light().textTheme.copyWith().labelSmall!.copyWith(
            fontSize: GeneralSize.textsize7, fontWeight: GeneralSize.boldfont),
        bodyLarge: ThemeData.light().textTheme.copyWith().bodyLarge!.copyWith(
            fontSize: GeneralSize.textsize4,
            fontWeight: GeneralSize.regularfont),
        bodyMedium: ThemeData.light().textTheme.copyWith().bodyMedium!.copyWith(
            fontSize: GeneralSize.textsize5,
            fontWeight: GeneralSize.regularfont),
        bodySmall: ThemeData.light().textTheme.copyWith().bodySmall!.copyWith(
            fontSize: GeneralSize.textsize6,
            fontWeight: GeneralSize.regularfont),
        displaySmall: ThemeData.light()
            .textTheme
            .copyWith()
            .displaySmall!
            .copyWith(
                fontSize: GeneralSize.textsize7,
                fontWeight: GeneralSize.regularfont),
      );
}


//  static double textsize1 = 28;
//   static double textsize2 = 24;
//   static double textsize3 = 22;
//   static double textsize4 = 18;
//   static double textsize5 = 16;
//   static double textsize6 = 14;
//   static double textsize7 = 12;