import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

Widget errorWidget(context, error) {
  return Center(
    child: Text(
      error.toString(),
      style: Theme.of(context).textTheme.bodySmall,
      textScaler: textScale(context),
    ),
  );
}
