import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customdialog {
  static void showError(msg) {
    Get.snackbar("", msg, snackPosition: SnackPosition.BOTTOM);
  }

  static void showSuccess(msg) {
    Get.snackbar("", msg, snackPosition: SnackPosition.BOTTOM);
  }
}
