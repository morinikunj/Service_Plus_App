import 'package:get/get.dart';
import 'package:service_plus_app/models/response/login_response.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/pages/admin/user/users_page.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/services/user_service.dart';
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

  UserProfileResponse? userProfile;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProfileData();
    super.onInit();
  }

  void fetchProfileData() async {
    try {
      isLoading.value = true;
      var userProfileResponse = await UserService().getUserProfile();
      print("data: ${userProfileResponse!.name} ${userProfileResponse!.name}");
      if (userProfileResponse.email != null) {
        userProfile = userProfileResponse;
      }
    } finally {
      isLoading.value = false;
    }
  }

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
