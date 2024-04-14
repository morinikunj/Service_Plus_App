import 'package:get/get.dart';
import 'package:service_plus_app/pages/admin/admin_page.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_page.dart';
import 'package:service_plus_app/pages/customer/home/home_page.dart';

import '../bindings/general_bindings.dart';

class AppRoutes {
  // App Routes Name

  //customer
  static String home = "/home_page";
  static String categoryDetails = "/category_details";

  //admin
  static String admin = "/admin_page";
  static String p = "/p";

  // App Routes
  static List<GetPage> routes = [
    GetPage(
        name: home, page: () => const HomePage(), binding: GeneralBinding()),
    GetPage(
        name: admin, page: () => const AdminPage(), binding: GeneralBinding()),
    GetPage(
        name: categoryDetails,
        page: () => const CategoryDetailsPage(),
        binding: GeneralBinding()),
  ];
}
