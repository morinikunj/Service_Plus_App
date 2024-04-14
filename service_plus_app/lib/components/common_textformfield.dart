import 'package:flutter/material.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';

Widget commonTextField({
   String? labelText,
   String? hintText,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  void Function(String)? onChanged,
  String? Function(String?)? validator,
  Widget? prefixIcon,
  Widget? suffixIcon,
  EdgeInsets? padding
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: GeneralSize.borderRadius1
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: GeneralSize.textsize5
      ),
      filled: true,
      fillColor: AppColors.greyColor1,
    ),
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    validator: validator,
  );
}
