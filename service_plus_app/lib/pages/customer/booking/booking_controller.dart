import 'dart:convert';

import 'package:get/get.dart';
import 'package:service_plus_app/pages/customer/bottom_navbar/bottom_navbar_controller.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_controller.dart';
import 'package:service_plus_app/pages/customer/expert_deatails/expert_details_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/booking_service.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/dialog_util/custom_loader.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class BookingController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int currentSlot = 0;
  var selectAddress = "";
  ExpertDetailsController detailsController = Get.find();
  BottomNavbarController navbarController = Get.find();
  

  List times = [
    "9:00 AM",
    "8:00 AM",
    "9:00 AM",
    "8:00 AM",
    "9:00 AM",
    "8:00 AM",
    "9:00 AM",
    "8:00 AM"
  ];

  selectDate(value) {
    selectedDate = value;
    update(["booking"]);
  }

  selectTime(index) {
    currentSlot = index;
    update(["booking"]);
  }

  void confirm() async {
    try {
      CustomLoader.showLoader();
    final id = await SessionManager().getUserId();
    final user = await UserService().getUserProfile();
    Map<String, dynamic> data = {
      "serviceProviderId": detailsController.serviceProvider!.sId ?? "",
      "userId": id ?? "",
      "serviceProviderName": detailsController.serviceProvider!.name ?? "",
      "userName": user!.name ?? "",
      "bookingDate":selectedDate.toString(),
      "bookingTime": times[currentSlot],
      "charge": detailsController.serviceProvider!.charge,
      "address": selectAddress
    };
    await BookingService().bookService(jsonEncode(data)).then((value) {
      CustomLoader.hideLoader();
        Get.offAndToNamed(AppRoutes.bookingSuccess);
    }).onError((error, stackTrace) {
      CustomLoader.hideLoader();
      Customdialog.showError(error);
    });
    } catch (e) {
      
    } finally {
      CustomLoader.hideLoader();
    }
  }

  void selectAddressMethod(val){
     selectAddress = val;
     update(["booking"]);
  }

  void gotoBooking(){
    navbarController.currentPage = 2;
    Get.offAndToNamed(AppRoutes.bottomNavbar);
  }
}
