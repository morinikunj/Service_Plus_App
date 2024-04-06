import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';

Gradient customGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    tileMode: TileMode.clamp,
    colors: [
      AppColors.primaryGredientColor,
      AppColors.whiteColor
      ]
  );
