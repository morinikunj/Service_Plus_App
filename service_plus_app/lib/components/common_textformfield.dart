import 'package:flutter/material.dart';

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
      border: const OutlineInputBorder(),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding
    ),
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    validator: validator,
  );
}
