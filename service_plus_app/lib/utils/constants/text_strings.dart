import 'package:flutter/material.dart';
import '../responsive_util/responsive_util.dart';

 textScale(context) => TextScaler.linear(ResponsiveUtil.instance.textScaleFactor(context));
