import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class RegisterController extends GetxController {
  TextEditingController emailTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isVisible = true;

  String emailValidate(value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value == "") {
      return "Please enter email!";
    } else if (!emailRegex.hasMatch(value)) {
      return "Please enter valid email!";
    }
    return "";
  }

  String passwordValidate(value) {
    if (value == null || value == "") {
      return "Please enter password!";
    } else if (value.length < 6) {
      return "Password is too short";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password should be strong";
    }
    return "";
  }

  String nameValidate(value) {
    if (value == null || value == "") {
      return "Please enter your name!";
    }
    return "";
  }

  void register() {
    if (key.currentState!.validate()) {
      key.currentState?.save();
    }
  }

  void loginButtonClick() {
    Get.offAndToNamed(AppRoutes.login);
  }

  void passwordVisible() {
    isVisible = !isVisible;
    update(["register"]);
  }
}
