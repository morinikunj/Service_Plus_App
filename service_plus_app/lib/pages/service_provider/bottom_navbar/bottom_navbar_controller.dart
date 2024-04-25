import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details.dart';
import 'package:service_plus_app/pages/customer/chat/chat_page.dart';
import 'package:service_plus_app/pages/customer/home/home_page.dart';
import 'package:service_plus_app/pages/customer/notification/notification_page.dart';
import 'package:service_plus_app/pages/customer/profile/profile_page.dart';
import 'package:service_plus_app/pages/service_provider/bookings/booking_details.dart';
import 'package:service_plus_app/pages/service_provider/chat/chat_page.dart';
import 'package:service_plus_app/pages/service_provider/notification/notification_page.dart';
import 'package:service_plus_app/pages/service_provider/profile/profile_page.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

class ProviderBottomNavbarController extends GetxController {
  int currentPage = 0;

  final pages = [
    Container(
      color: Colors.red,
    ),
    const ProviderChatPage(),
    const ProviderBookingsPage(),
    const ProviderNotificationPage(),
    const ProviderProfilePage()
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
