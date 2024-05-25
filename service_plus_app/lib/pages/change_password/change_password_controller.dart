import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/utils/dialog_util/custom_loader.dart';

class ChangePasswordController extends GetxController{

  final formkey = GlobalKey<FormState>();
  TextEditingController oldTC = TextEditingController();
  TextEditingController newTC = TextEditingController();


   String? validater(value) {
    if (value == null || value == "") {
      return "Please enter password!";
    }
    return null;
  }


  void submit() async{
    if (formkey.currentState!.validate()) { print("tapped...");
     try {
        CustomLoader.showLoader();
      Map<String, dynamic> data = {
        "oldPassword": oldTC.text,
        "newPasswprd": newTC.text
      };

      await AuthServices().changePassword(jsonEncode(data));

     } catch (e) {
       
     } finally{
      CustomLoader.hideLoader();
      Get.back();
     }
    }
  }
  
}