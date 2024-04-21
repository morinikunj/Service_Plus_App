import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';

Widget commonTextField(
    {String? labelText,
    String? hintText,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? fill,
    Color? hintTextColor,
    InputBorder? border,
    EdgeInsets? padding}) {
  return TextFormField(
    style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: GeneralSize.textsize5,
        color: hintTextColor ?? AppColors.greyColor),
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: border ??
          OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: GeneralSize.borderRadius1),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding:
          padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: GeneralSize.textsize5,
          color: hintTextColor ?? AppColors.greyColor),
      filled: fill ?? true,
      fillColor: Colors.black12,
    ),
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    validator: validator,
  );
}
