import 'package:get/get.dart';
import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/pages/customer/home/home_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/user_service.dart';

class CategoryDetailsController extends GetxController {
  List<Categories> categoryResponse = <Categories>[];
  var isLoading = true.obs;
  HomeController homeController = Get.find();
  List<ServiceProviderProfileDetails> serviceProviders = [];
  ServiceProviderProfileDetails? selectedProfile;

  @override
  void onInit() {
    fetchCategoryData();
    fetchServiceProvider();
    super.onInit();
  }

  void fetchCategoryData() {
    try {
      isLoading.value = true;
      List<Categories>? categories =
          homeController.categoryResponse.value.categories;
      if (categories![0].name != null) {
        categoryResponse = categories;
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  void fetchServiceProvider() async {
    try {
      isLoading.value = true;
      if (categoryResponse.isNotEmpty) {
        final data = homeController.categoryResponse.value
            .categories![homeController.currentSelectedIndex];
        List<ServiceProviderProfileDetails>? list = await UserService()
            .getServiceProviderList(data.name.toString().toLowerCase());
        print("date : ${list}");
        if (list != null) {
          serviceProviders = list;
        }
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  bookButtonClicked(index) {
    selectedProfile = serviceProviders[index];
    Get.toNamed(AppRoutes.expertDetails);
  }
}
