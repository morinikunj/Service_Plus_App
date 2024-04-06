import 'package:get/get.dart';
import 'package:service_plus_app/home.dart';

import '../bindings/general_bindings.dart';

class AppRoutes {
  // App Routes Names
  static String homepage = "/home_page";

  // App Routes
  static List<GetPage> routes = [
    GetPage(name: homepage, page: () => const HomePage(), binding: GeneralBinding())
  ];
}
