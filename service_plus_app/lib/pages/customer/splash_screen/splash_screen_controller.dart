import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/auth_services.dart';

class SplashScreenController extends GetxController {
  @override
  onInit() {
    checkLogin();
    super.onInit();
  }

  checkLogin() async {
    bool value = await AuthServices().isTokenValid();
    if (value) {
      Get.offAndToNamed(AppRoutes.bottomNavbar);
    } else {
      Get.offAndToNamed(AppRoutes.login);
    }
  }
}
