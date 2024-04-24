import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';
import 'package:service_plus_app/pages/customer/add_address/add_address_controller.dart';
import 'package:service_plus_app/pages/customer/booking/booking_controller.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details_controller.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_controller.dart';
import 'package:service_plus_app/pages/customer/chat/chat_controller.dart';
import 'package:service_plus_app/pages/customer/home/home_controller.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_controller.dart';
import 'package:service_plus_app/pages/customer/login/login_controller.dart';
import 'package:service_plus_app/pages/customer/profile/profile_controller.dart';
import 'package:service_plus_app/pages/customer/register/register_controller.dart';
import 'package:service_plus_app/pages/customer/wallet/wallet_controller.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    //admin
    Get.lazyPut(() => SideMenuController());
    Get.lazyPut(() => DashboardController());

    //customer
    Get.lazyPut(() => IntroController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryDetailsController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => BookingDetailsController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => BookingController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => AddAdressController());
  }
}
