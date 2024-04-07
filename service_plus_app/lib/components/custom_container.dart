import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_gradient.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';

Container customContainer({
  double? height,
  double? width,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double? borderRadius,
  Widget? child,
  Color? color,
  BoxBorder? border,
  BoxDecoration? decoration,
  bool isGradient = false,
  BoxShape? shape,
  AlignmentGeometry? alignment
}) => Container(
  alignment: alignment,
  height: height,
  width: width,
  padding: padding ?? GeneralSize.padding2,
  margin: margin,
  decoration: decoration ?? BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
    border: border,
    gradient: isGradient ? customGradient : null,
    shape: shape ?? BoxShape.rectangle
  ),
  child: child,
);
