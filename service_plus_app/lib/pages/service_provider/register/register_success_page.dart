import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/successful_widget.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class ProviderRegistrationSuccessPage extends StatelessWidget {
  const ProviderRegistrationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessfulWidget(
      btnTitle: "got to login",
      desc: "Your account is created successfully.",
      onPress: () {
        Get.offAndToNamed(AppRoutes.providerLogin);
      },
    );
  }
}
