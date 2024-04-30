import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/pages/service_provider/bookings/booking_details.dart';
import 'package:service_plus_app/pages/service_provider/chat/chat_page.dart';
import 'package:service_plus_app/pages/service_provider/dashboard/dashboard_page.dart';
import 'package:service_plus_app/pages/service_provider/notification/notification_page.dart';
import 'package:service_plus_app/pages/service_provider/profile/profile_page.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

class ProviderBottomNavbarController extends GetxController {
  int currentPage = 0;

  final pages = [
    DashBoardapage(),
    //const ProviderChatPage(),
    const ProviderBookingsPage(),
   // const ProviderNotificationPage(),
    ProviderProfilePage()
  ];

  List<IconData> data = [
    AppIcons.homeIcon,
   // AppIcons.chatIcon,
    AppIcons.bookingIcon,
  //  AppIcons.notifyIcon,
    AppIcons.userIcon
  ];

  void onPageSelected(value) {
    currentPage = value;
    update(["navbar"]);
  }
}
