import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/models/request/auth/register.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/utils/dialog_util/custom_loader.dart';

class RegisterController extends GetxController {
  TextEditingController emailTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  final key = GlobalKey<FormState>();
  bool isVisible = true;
  bool isLoading = false;

  String? emailValidate(value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value == "") {
      return "Please enter email!";
    } else if (!emailRegex.hasMatch(value)) {
      return "Please enter valid email!";
    }
    return null;
  }

  String? passwordValidate(value) {
    if (value == null || value == "") {
      return "Please enter password!";
    } else if (value.length < 6) {
      return "Password is too short";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password should be strong";
    }
    return null;
  }

  String? nameValidate(value) {
    if (value == null || value == "") {
      return "Please enter your name!";
    }
    return null;
  }

  void register() async {
    if (key.currentState!.validate()) {
      key.currentState?.save();
      CustomLoader.showLoader();
      Map<String, String> data = {
        "name": nameTC.text,
        "email": emailTC.text,
        "password": passwordTC.text
      };
      try {
        await AuthServices().register(jsonEncode(data));
        CustomLoader.hideLoader();
        Get.offAndToNamed(AppRoutes.registerSuccess);
      } catch (e) {
        CustomLoader.hideLoader();
        Get.snackbar("Regitration failed", "$e");
      }
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
