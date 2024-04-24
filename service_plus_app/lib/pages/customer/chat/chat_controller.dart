import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController msgTC = TextEditingController();
  bool isActiveBtn = false;
  @override
  void onInit() {
    msgTC.addListener(checkStatus);
    super.onInit();
  }

  void checkStatus() {
    if (msgTC.text.isNotEmpty) {
      isActiveBtn = true;
      update(["chat_msg"]);
    } else {
      isActiveBtn = false;
      update(["chat_msg"]);
    }
  }

  void back() {
    Get.back();
  }
}
