import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class BookingController extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  int currentSlot = 0;

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

  void confirm() {
    Get.offAndToNamed(AppRoutes.bookingSuccess);
  }
}
