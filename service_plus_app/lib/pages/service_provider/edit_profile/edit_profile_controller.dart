import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/image_select_widget.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/services/service_provider_services.dart';
import 'package:service_plus_app/services/user_service.dart';

class ProviderEditProfileController extends GetxController {
  ServiceProviderProfileDetails? userProfileResponse;
  var isLoading = false.obs;
  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController phoneNoTC = TextEditingController();
  File? file;
  String profileImg = "";
  final key = GlobalKey<FormState>();


  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    try {
      userProfileResponse = await ServiceProviderService().getServiceProviderProfileDetails();
      if (userProfileResponse!.name != null) {
        nameTC.text = userProfileResponse!.name.toString();
        emailTC.text = userProfileResponse!.email.toString();
        phoneNoTC.text = userProfileResponse!.phoneNumber.toString();
        profileImg = userProfileResponse!.image.toString();
        update(["edit_profile"]);
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  void onPickImage(BuildContext context) {
    OpenBottomSheet(
      callback: (pickedFile) {
        file = pickedFile;
        update(["edit_profile"]);
      },
    ).show(context);
  }

  void sumit() async {
    isLoading.value = true;
    try {

      Map<String, dynamic> data = {};
      
      if (file != null) {
        final img = await UserService().uploadImage(file!);
         data = {
          "name": nameTC.text,
          "email": emailTC.text,
          "mobileNo": phoneNoTC.text,
          "profileImg": img
        };
      } else {
          data = {
          "name": nameTC.text,
          "email": emailTC.text,
          "mobileNo": phoneNoTC.text,
        };
      }

      await UserService().updateProfile(jsonEncode(data));
    } finally{
      isLoading.value = false;
    }
  }
}