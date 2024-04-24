import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

class ProfileController extends GetxController {
  List data = [
    {
      "icon": AppIcons.profileEditIcon,
      "title": "Edit Profile",
    },
    {
      "icon": AppIcons.paymentIcon,
      "title": "Wallet",
    },
    {
      "icon": AppIcons.locationIcon,
      "title": "Manage Address",
    },
    {
      "icon": AppIcons.passwordIcon,
      "title": "Change Passowrd",
    },
    {
      "icon": AppIcons.helpIcon,
      "title": "Help",
    },
  ];

  onPress(index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.editProfile);
        break;
      case 1:
        Get.toNamed(AppRoutes.wallet);
        break;
      case 2:
        Get.toNamed(AppRoutes.addAddress);
      default:
    }
  }
}
