import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';

Widget emptyDataWidget(BuildContext context, String msg) {
  return Center(
    child: Text(
      msg,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColors.greyColor1),
    ),
  );
}
