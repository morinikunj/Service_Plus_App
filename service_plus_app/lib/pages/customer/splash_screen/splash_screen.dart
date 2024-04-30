import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/pages/customer/splash_screen/splash_screen_controller.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Image.asset(
        AppImage.splashImg,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    ));
  }
}
