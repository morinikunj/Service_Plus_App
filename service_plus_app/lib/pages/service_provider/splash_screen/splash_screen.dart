import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/loading_widget.dart';
import 'package:service_plus_app/pages/service_provider/splash_screen/splash_screen_controller.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';

class ProviderSplashScreen extends StatelessWidget {
  ProviderSplashScreen({super.key});
  ProviderSplashScreenController controller =
      Get.put(ProviderSplashScreenController());

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
