import 'package:get/get.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

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

  UserProfileResponse? userProfileResponse;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      userProfileResponse = await UserService().getUserProfile();
    } catch (e) {
      print("error : $e");
    }
  }

  onPress(index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.providerEditProfile);
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
