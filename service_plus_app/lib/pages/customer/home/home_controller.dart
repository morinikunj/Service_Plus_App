import 'package:get/get.dart';
import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/user_service.dart';

class HomeController extends GetxController {
  var categoryResponse = CategoryResponse().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCategoryData();
    super.onInit();
  }

  void fetchCategoryData() async {
    try {
      isLoading.value = true;
      var categories = await UserService().getCategories();
      if (categories != null) {
        categoryResponse.value = categories;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(index) {
    Get.toNamed(AppRoutes.categoryDetails, arguments: {"index": index});
  }
}
