import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_controller.dart';
import 'package:service_plus_app/pages/customer/login/login_controller.dart';
import 'package:service_plus_app/pages/customer/register/register_controller.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    //Admin Controllers
    Get.lazyPut(() => SideMenuController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => IntroController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
  }
}
