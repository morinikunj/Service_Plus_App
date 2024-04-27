import 'package:service_plus_app/models/response/login_response.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';

class AuthServices {
  late final DioClient dio;
  AuthServices() {
    dio = DioClient();
  }

  //register
  Future<void> register(data) async {
    try {
      var url = ApiEndPoints.signup;
      final response = await dio.post(url, data);
      if (response.statusCode == 200) {
        final msg = response.data["msg"];
        Customdialog.showSuccess(msg.toString());
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
      }
    } catch (e) {
      Customdialog.showError(e.toString());
    }
  }

  //login
  Future<UserResponse?> login(data) async {
    try {
      var url = ApiEndPoints.signin;
      final response = await dio.post(url, data);
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
      }
    } catch (e) {
      Customdialog.showError(e.toString());
    }
    return null;
  }

  //token is valid
  Future<bool> isTokenValid() async {
    try {
      var url = ApiEndPoints.tokenValid;
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
