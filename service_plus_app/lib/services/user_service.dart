import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/constants/app_constants.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';

class UserService {
  late final DioClient dio;

  UserService() {
    dio = DioClient();
  }

  //fetch user profile
  Future<UserProfileResponse?> getUserProfile() async {
    try {
      final email = AppConstant.userEmail;
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
}
