import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/models/response/login_response.dart';
import 'package:service_plus_app/pages/admin/user/users_page.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/utils/constants/app_constants.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/dialog_util/custom_loader.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class ProviderLoginController extends GetxController {
  TextEditingController emailTC = TextEditingController();
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

  void forgetPassword() {}

  void login() async {
    if (key.currentState!.validate()) {
      key.currentState?.save();
      CustomLoader.showLoader();
      final fcm = await SessionManager().fcm;
      Map<String, dynamic> data = {
        "email": emailTC.text,
        "password": passwordTC.text,
        "fcm": fcm
      };

      try {
        UserResponse? userData = await AuthServices().login(jsonEncode(data));
        await SessionManager().setToken(userData!.token.toString());
        await SessionManager().setEmail(userData.email!);
        await SessionManager().setUserId(userData.sId!);
        CustomLoader.hideLoader();
        Get.offAndToNamed(AppRoutes.providerBottomNavbar);
        Customdialog.showSuccess("Login Successful");
      } catch (e) {
        CustomLoader.hideLoader();
        Customdialog.showError(e.toString());
      }
    }
  }

  void registerButtonClick() {
    Get.offAndToNamed(AppRoutes.providerRegister);
  }

  void passwordVisible() {
    isVisible = !isVisible;
    update(["provider_login"]);
  }
}
