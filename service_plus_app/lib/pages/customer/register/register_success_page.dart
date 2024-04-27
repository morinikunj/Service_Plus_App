import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/successful_widget.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class RegistrationSuccessPage extends StatelessWidget {
  const RegistrationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessfulWidget(
      btnTitle: "Go to Login",
      desc: "Your account is created successfully.",
      onPress: () {
        Get.offAndToNamed(AppRoutes.login);
      },
    );
  }
}
