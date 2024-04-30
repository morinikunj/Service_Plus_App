import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customdialog {
  static void showError(msg) {
    Get.snackbar("", msg, snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.fromLTRB(20, 0, 20, 30));
  }

  static void showSuccess(msg) {
    Get.snackbar("", msg, snackPosition: SnackPosition.BOTTOM);
  }
}
