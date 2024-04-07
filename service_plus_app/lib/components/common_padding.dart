import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

EdgeInsets commonSysmPadding(context, {double? horizontal, double? vertical}) =>
    EdgeInsets.symmetric(
        horizontal: ResponsiveUtil.width(horizontal ?? 0, context),
        vertical: ResponsiveUtil.height(vertical ?? 0, context));
