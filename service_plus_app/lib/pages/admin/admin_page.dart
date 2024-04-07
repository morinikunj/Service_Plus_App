import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';
import 'package:service_plus_app/pages/admin/bookings/bookings_page.dart';
import 'package:service_plus_app/pages/admin/category/category_page.dart';
import 'package:service_plus_app/pages/admin/dashboard/dashboard_page.dart';
import 'package:service_plus_app/pages/admin/provider/provider_page.dart';
import 'package:service_plus_app/pages/admin/services/services_page.dart';
import 'package:service_plus_app/pages/admin/side_menu.dart';
import 'package:service_plus_app/pages/admin/user/users_page.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withOpacity(0.1),
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: SideMenu(),
          ),
          Expanded(flex: 8, child: body())
        ],
      ),
    );
  }

  Widget body() {
    return GetBuilder(
      id: "menu",
      init: SideMenuController(),
      builder: (controller) {
        switch (controller.isSelected) {
          case 0:
            return const DashboardPage();
          case 1:
            return const UsersPage();
          case 2:
            return const ProviderPage();
          case 3:
            return const CategoryPage();
          case 4:
            return const ServicesPage();
          case 5:
            return const BookingsPage();
          default:
            const Text("Something wrong");
        }
        return Container();
      },
    );
  }
}
