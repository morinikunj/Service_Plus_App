import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class DashboardProviderController extends GetxController {
  int currentStep = 0;
  var id;

  @override
  void onInit() {
    getId();
    super.onInit();
  }

  void getId() async {
    try {
      id = await SessionManager().getUserId();
    } catch (e) {
      
    }
  }
 
}