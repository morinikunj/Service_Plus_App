import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

Widget noDataFound(BuildContext context) {
  return Center(
    child: Text(
      "No Data Found",
      style: Theme.of(context).textTheme.bodyMedium!,
      textScaler: textScale(context),
    ),
  );
}
