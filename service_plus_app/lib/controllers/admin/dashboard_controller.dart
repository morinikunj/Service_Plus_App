import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class DashboardController extends GetxController {
  List<Map<String, dynamic>> itemList = [
    {
      "icon" : AppIcons.userGroupIcon,
      "title" : users,
      "count" : "5",
      "color" : AppColors.secondaryColor
    },
    {
      "icon" : AppIcons.providerIcon,
      "title" : serviceProvider,
      "count" : "10",
      "color" : AppColors.greenColor
    },
    {
      "icon" : AppIcons.bookingIcon,
      "title" : bookings,
      "count" : "3",
      "color" : AppColors.secondaryColor
    },
    {
      "icon" : AppIcons.paymentIcon,
      "title" : payments,
      "count" : "10",
      "color" : AppColors.greenColor
    },
     {
      "icon" : AppIcons.categoryIcon,
      "title" : category,
      "count" : "10",
      "color" : AppColors.primaryColor
    },
     {
      "icon" : AppIcons.serviceIcon,
      "title" : service,
      "count" : "10",
      "color" : AppColors.yellowColor
    }, 
  ];



}
