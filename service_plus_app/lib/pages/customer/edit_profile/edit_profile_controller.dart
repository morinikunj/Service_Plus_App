
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:service_plus_app/components/image_select_widget.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/dialog_util/custom_loader.dart';

class EditProfileController extends GetxController{
  UserProfileResponse? userProfileResponse;
  var isLoading = true.obs;
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
      isLoading.value = true;
    userProfileResponse = await UserService().getUserProfile();
    if (userProfileResponse!.name!= null) { 
      nameTC.text = userProfileResponse!.name.toString();
      emailTC.text = userProfileResponse!.email.toString();
      phoneNoTC.text = userProfileResponse!.mobileNo.toString();
      profileImg = userProfileResponse!.profileImg!.toString();
      update(["edit_profile"]);
    }
    } catch (e) {
      
    } finally{
      isLoading.value = false;
    }

  } 


  void onPickImage(BuildContext context){
    OpenBottomSheet(callback: (pickedFile) {
      file = pickedFile;
      update(["edit_profile"]);
    },).show(context);
  }

  void sumit() async {
   try {
    CustomLoader.showLoader();
      final img = await UserService().uploadImage(file!);
    Map<String, dynamic> data = {
      "name": nameTC.text,
      "email": emailTC.text,
      "mobileNo": phoneNoTC.text,
      "profileImg": img
    };
    await UserService().updateProfile(jsonEncode(data));
   }
      finally {
     CustomLoader.hideLoader();
      }
   


  
  
  }


}