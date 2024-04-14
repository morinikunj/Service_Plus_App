import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';

Widget customElevatedButton(
  BuildContext context, {
  Widget? child,
  VoidCallback? onPressed,
  ButtonStyle? buttonStyle,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: buttonStyle,
    child: Padding(
      padding: commonSysmPadding(context, horizontal: 5, vertical: 15),
      child: child,
    ),
  );
}
