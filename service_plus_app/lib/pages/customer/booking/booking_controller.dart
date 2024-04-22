import 'package:get/get.dart';

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
}
