import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';
import 'package:service_plus_app/pages/change_password/change_password_controller.dart';
import 'package:service_plus_app/pages/customer/add_address/add_address_controller.dart';
import 'package:service_plus_app/pages/customer/booking/booking_controller.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details_controller.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_controller.dart';
import 'package:service_plus_app/pages/customer/chat/chat_controller.dart';
import 'package:service_plus_app/pages/customer/edit_profile/edit_profile_controller.dart';
import 'package:service_plus_app/pages/customer/home/home_controller.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_controller.dart';
import 'package:service_plus_app/pages/customer/login/login_controller.dart';
import 'package:service_plus_app/pages/customer/profile/profile_controller.dart';
import 'package:service_plus_app/pages/customer/register/register_controller.dart';
import 'package:service_plus_app/pages/customer/wallet/wallet_controller.dart';
import 'package:service_plus_app/pages/service_provider/bookings/booking_details_controller.dart';
import 'package:service_plus_app/pages/service_provider/bottom_navbar/bottom_navbar_controller.dart';
import 'package:service_plus_app/pages/service_provider/chat/chat_controller.dart';
import 'package:service_plus_app/pages/service_provider/dashboard/dashboard_controller.dart';
import 'package:service_plus_app/pages/service_provider/login/login_controller.dart';
import 'package:service_plus_app/pages/service_provider/profile/profile_controller.dart';
import 'package:service_plus_app/pages/service_provider/register/register_controller.dart';
import 'package:service_plus_app/pages/service_provider/splash_screen/splash_screen_controller.dart';
import 'package:service_plus_app/pages/service_provider/wallet/wallet_controller.dart';

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

    //service provider
    Get.lazyPut(() => ProviderRegisterController());
    Get.lazyPut(() => ProviderLoginController());
    Get.lazyPut(() => ProviderChatController());
    Get.lazyPut(() => ProviderBookingController());
    Get.lazyPut(() => ProviderWalletController());
    Get.lazyPut(() => ProviderBottomNavbarController());
    Get.lazyPut(() => ProviderProfileController());
    Get.lazyPut(() => ProviderSplashScreenController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => ChangePasswordController(),);
    Get.lazyPut(() => DashboardProviderController());
  }
}
