import 'package:get/get.dart';
import 'package:service_plus_app/pages/admin/admin_page.dart';
import 'package:service_plus_app/pages/customer/booking/booking_page.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details.dart';
import 'package:service_plus_app/pages/customer/bottom_navbar/bottom_navbar_page.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_page.dart';
import 'package:service_plus_app/pages/customer/chat/chat_page.dart';
import 'package:service_plus_app/pages/customer/edit_profile/edit_profile_page.dart';
import 'package:service_plus_app/pages/customer/expert_deatails/expert_deatails_page.dart';
import 'package:service_plus_app/pages/customer/home/home_page.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_page.dart';
import 'package:service_plus_app/pages/customer/login/login_page.dart';
import 'package:service_plus_app/pages/customer/notification/notification_page.dart';
import 'package:service_plus_app/pages/customer/profile/profile_page.dart';
import 'package:service_plus_app/pages/customer/register/register_page.dart';

import '../bindings/general_bindings.dart';

class AppRoutes {
  // App Routes Name

  //customer
  static String home = "/home_page";
  static String categoryDetails = "/category_details";
  static String expertDetails = "/expert_details";
  static String booking = "/booking";
  static String bookingsDetails = "/booking_details";
  static String chat = "/chat";
  static String notification = "/notification";
  static String profile = "/profile";
  static String editProfile = "/edit_profile";
  static String intro = "/intro";
  static String login = "/login";
  static String register = "/Register";
  static String bottomNavbar = "/bottom_navbar";

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
    GetPage(
        name: expertDetails,
        page: () => const ExpertDetailsPage(),
        binding: GeneralBinding()),
    GetPage(
        name: booking,
        page: () => const BookingPage(),
        binding: GeneralBinding()),
    GetPage(
        name: bookingsDetails,
        page: () => const BookingDetailsPage(),
        binding: GeneralBinding()),
    GetPage(
        name: chat, page: () => const ChatPage(), binding: GeneralBinding()),
    GetPage(
        name: notification,
        page: () => const NotificationPage(),
        binding: GeneralBinding()),
    GetPage(
        name: profile,
        page: () => const ProfilePage(),
        binding: GeneralBinding()),
    GetPage(
        name: editProfile,
        page: () => const EditProfilePage(),
        binding: GeneralBinding()),
    GetPage(name: intro, page: () => IntroPage(), binding: GeneralBinding()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: GeneralBinding()),
    GetPage(
        name: register,
        page: () => const RegisterPage(),
        binding: GeneralBinding()),
    GetPage(
        name: bottomNavbar,
        page: () => const BottomNavbarPage(),
        binding: GeneralBinding())
  ];
}
