import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class AddAdressController extends GetxController {
  TextEditingController titleTC = TextEditingController();
  TextEditingController addressTC = TextEditingController();
  final key = GlobalKey<FormState>();
  var addresses = <Addresses>[];
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAddressData();
    super.onInit();
  }

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

  void fetchAddressData() async {
    try {
      isLoading.value = true;
      UserProfileResponse? data =
          await UserService().getUserProfile().then((value) {
        isLoading.value = false;
      });
      if (data!.addresses!.isEmpty) {
        addresses = data.addresses as List<Addresses>;
      }
      print("data");
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
