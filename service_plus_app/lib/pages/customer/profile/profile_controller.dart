import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';

class ProfileController extends GetxController {
  List data = [
    {
      "icon": AppIcons.profileEditIcon,
      "title": "Edit Profile",
      "onpress": Get.toNamed(AppRoutes.editProfile)
    },
    {"icon": AppIcons.profileEditIcon, "title": "Edit Profile"},
    {"icon": AppIcons.profileEditIcon, "title": "Edit Profile"},
    {"icon": AppIcons.profileEditIcon, "title": "Edit Profile"},
    {"icon": AppIcons.profileEditIcon, "title": "Edit Profile"}
  ];
}
