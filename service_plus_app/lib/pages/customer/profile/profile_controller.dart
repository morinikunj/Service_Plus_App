import 'package:get/get.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

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
    // {
    //   "icon": AppIcons.locationIcon,
    //   "title": "Manage Address",
    // },
    {
      "icon": AppIcons.passwordIcon,
      "title": "Change Passowrd",
    },
    // {
    //   "icon": AppIcons.helpIcon,
    //   "title": "Help",
    // },
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
      print("data: ${userProfileResponse!.name} ${userProfileResponse.name}");
      if (userProfileResponse.email != null) {
        userProfile = userProfileResponse;
      }
    } finally {
      isLoading.value = false;
    }
  }

  logout() async {
    await SessionManager().setToken("");
    Get.offAndToNamed(AppRoutes.login);
  }

  onPress(index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.editProfile);
        break;
      case 1:
        Get.toNamed(AppRoutes.wallet);
        break;
      // case 2:
      //   Get.toNamed(AppRoutes.addAddress);
      case 2:
      Get.toNamed(AppRoutes.changePassowrd);
      default:
    }
  }
}
