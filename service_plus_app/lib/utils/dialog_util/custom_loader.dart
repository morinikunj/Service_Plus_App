import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoader {
  static void showLoader() {
    Get.dialog(const Center(
      child: CircularProgressIndicator(),
      
    ),
    barrierDismissible: false,
    );
  }

  static void hideLoader() {
    bool? value = Get.isDialogOpen;
    if (value != null && value) {
      Get.back();
    }
  }
}
