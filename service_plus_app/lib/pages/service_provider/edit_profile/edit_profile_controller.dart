import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  TextEditingController serviceTC = TextEditingController();
  TextEditingController cityTC = TextEditingController();
  TextEditingController chargeTC = TextEditingController();
  TextEditingController perTC = TextEditingController();
  
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
        perTC.text = userProfileResponse!.charge!.per.toString();
        serviceTC.text = userProfileResponse!.service!.toString();
        cityTC.text = userProfileResponse!.serviceLocation!.toString();
        chargeTC.text = userProfileResponse!.charge!.amount!.toString();
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
          "profileImg": img,
          "service": serviceTC.text,
          "charge": Charge(amount: int.tryParse(chargeTC.text), per: perTC.text,).toJson(),
          "serviceLocation": cityTC.text,
        };
      } else {
          data = {
          "name": nameTC.text,
          "email": emailTC.text,
          "mobileNo": phoneNoTC.text,
          "service": serviceTC.text,
          "charge": Charge(amount: int.tryParse(chargeTC.text), per: perTC.text,).toJson(),
          "serviceLocation": cityTC.text,
        };
      }

      await ServiceProviderService().updateServiceProviderProfileDetails(data);
    } finally{
      isLoading.value = false;
    }
  }
}