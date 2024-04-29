import 'package:get/get.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_controller.dart';
import 'package:service_plus_app/pages/customer/home/home_controller.dart';

class ExpertDetailsController extends GetxController {
  ServiceProviderProfileDetails? serviceProvider;
  var isLoading = true.obs;
  CategoryDetailsController controller = Get.find();
  HomeController homeController = Get.find();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() {
    try {
      isLoading.value = true;
      var data = controller.selectedProfile;
      if (data != null) {
        serviceProvider = data;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
