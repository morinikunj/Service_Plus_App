import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

Widget backButton(BuildContext context) {
  return customContainer(
      color: AppColors.iconButtonColor,
      borderRadius: 100,
      child: Icon(
        AppIcons.backIcon,
        size: GeneralSize.iconSize *
            ResponsiveUtil.instance.textScaleFactor(context),
      ));
}
