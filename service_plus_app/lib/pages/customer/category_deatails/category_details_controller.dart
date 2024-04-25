import 'package:get/get.dart';
import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/services/user_service.dart';

class CategoryDetailsController extends GetxController {
  CategoryResponse? categoryResponse;

  void fetchData() async {
    try {
      categoryResponse = await UserService().getCategories();
    } catch (e) {}
  }
}
