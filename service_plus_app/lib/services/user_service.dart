import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/offline_repository/db_helper.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class UserService {
  late final DioClient dio;

  UserService() {
    dio = DioClient();
  }

  //fetch user profile
  Future<UserProfileResponse?> getUserProfile() async {
    try {
      final email = await SessionManager().getEmail();
      var url = ApiEndPoints.userProfile;
      final response = await dio.get("$url/$email");
      if (response.statusCode == 200) {
        return UserProfileResponse.fromJson(response.data);
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
        return null;
      }
    } catch (e) {
      Customdialog.showError(e.toString());
      return null;
    }
  }

  //get categories
  Future<CategoryResponse?> getCategories() async {
    try {
      var url = ApiEndPoints.categories;
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return CategoryResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  Future<List<ServiceProviderProfileDetails>?> getServiceProviderList(
      String service) async {
    try {
      var url = ApiEndPoints.getAllServiceProvider;
      final response = await dio.get("$url/$service");
      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map((e) => ServiceProviderProfileDetails.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }
}
