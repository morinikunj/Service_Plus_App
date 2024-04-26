import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details.dart';
import 'package:service_plus_app/pages/customer/chat/chat_page.dart';
import 'package:service_plus_app/pages/customer/home/home_page.dart';
import 'package:service_plus_app/pages/customer/notification/notification_page.dart';
import 'package:service_plus_app/pages/customer/profile/profile_page.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

class BottomNavbarController extends GetxController {
  int currentPage = 0;

  final pages = [
    HomePage(),
    const ChatPage(),
    const BookingDetailsPage(),
    const NotificationPage(),
    ProfilePage()
  ];

  List<IconData> data = [
    AppIcons.homeIcon,
    AppIcons.chatIcon,
    AppIcons.bookingIcon,
    AppIcons.notifyIcon,
    AppIcons.userIcon
  ];

  void onPageSelected(value) {
    currentPage = value;
    update(["navbar"]);
  }
}
