import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {

    //Admin Controllers
    Get.lazyPut(() => SideMenuController());
    Get.lazyPut(() => DashboardController());
  }
}
