import 'package:get/get.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/service_provider_services.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class ProviderProfileController extends GetxController {
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
      "icon": AppIcons.ratingIcon,
      "title": "Ratings",
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
        Get.toNamed(AppRoutes.providerEditProfile);
        break;
      case 1:
        Get.toNamed(AppRoutes.providerWallet);
        break;
      case 2:
        Get.toNamed(AppRoutes.addAddress);
      default:
    }
  }
}
