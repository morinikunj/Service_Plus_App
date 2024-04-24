import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class AddAdressController extends GetxController {
  TextEditingController titleTC = TextEditingController();
  TextEditingController addressTC = TextEditingController();
  final key = GlobalKey<FormState>();

  String validateAddress(value) {
    if (value == null || value == "") {
      return addressError;
    }
    return "";
  }

  String validateTitle(value) {
    if (value == null || value == "") {
      return titleError;
    }
    return "";
  }

  addNewAddress(Widget widget) {
    Get.defaultDialog(
        title: "", content: widget, backgroundColor: AppColors.whiteColor);
  }

  void submit() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
    }
  }
}
