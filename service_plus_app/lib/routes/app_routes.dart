import 'package:get/get.dart';
import 'package:service_plus_app/pages/admin/admin_page.dart';
import 'package:service_plus_app/pages/customer/home/home_page.dart';

import '../bindings/general_bindings.dart';

class AppRoutes {
  // App Routes Names
  static String home = "/home_page";

  //admin
  static String admin = "/admin_page";
  static String p = "/p";

  // App Routes
  static List<GetPage> routes = [
    GetPage(
        name: home, page: () => const HomePage(), binding: GeneralBinding()),
    GetPage(
        name: admin, page: () => const AdminPage(), binding: GeneralBinding()),
  ];
}
