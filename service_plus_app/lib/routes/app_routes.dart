import 'package:get/get.dart';
import 'package:service_plus_app/home.dart';
import 'package:service_plus_app/pages/admin/admin_page.dart';

import '../bindings/general_bindings.dart';

class AppRoutes {
  // App Routes Names
  static String homepage = "/home_page";

  //admin
  static String adminPage = "/admin_page";

  // App Routes
  static List<GetPage> routes = [
    GetPage(name: homepage, page: () => const HomePage(), binding: GeneralBinding()),
    GetPage(name: adminPage, page: () => const AdminPage(), binding: GeneralBinding())
  ];
}
