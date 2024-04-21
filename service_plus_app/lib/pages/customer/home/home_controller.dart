import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class HomeController extends GetxController {
  void selectCategory() {
    Get.toNamed(AppRoutes.categoryDetails);
  }
}
