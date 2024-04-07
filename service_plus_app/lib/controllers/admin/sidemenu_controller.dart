import 'package:get/get.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class SideMenuController extends GetxController {
  int isSelected = 1;

  List<Map<String, dynamic>> dataList = [
    {"icon": AppIcons.dashboardIcon, "title": dashboard},
    {"icon": AppIcons.userGroupIcon, "title": userManagement},
    {"icon": AppIcons.providerIcon, "title": providerManagement},
    {"icon": AppIcons.categoryIcon, "title": category},
    {"icon": AppIcons.serviceIcon, "title": serviceManagement},
    {"icon": AppIcons.bookingIcon, "title": bookings}
  ];

  selectItem(int index) {
    isSelected = index;
    update(["menu"]);
  }
}
