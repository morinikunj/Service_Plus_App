import 'package:service_plus_app/utils/local_storage/share_pref_manager.dart';

class SessionManager {
  // final SessionManager _instance = SessionManager._();
  // SessionManager get instance => _instance;
  // SessionManager._();

  final String tokenKey = "TOKEN";
  final String emailKey = "user_email";
  final String userIdKey = "user_id";
  final String fcm = "fcm";

  Future<void> setToken(String value) async {
    await SharedPrefManager.setString(tokenKey, value);
  }

  Future<String?> getToken() async {
    return await SharedPrefManager.getString(tokenKey);
  }

  Future<void> setEmail(String value) async {
    await SharedPrefManager.setString(emailKey, value);
  }

  Future<String?> getEmail() async {
    return await SharedPrefManager.getString(emailKey);
  }

  Future<void> setUserId(String value) async {
    await SharedPrefManager.setString(userIdKey, value);
  }

  Future<String?> getUserId() async {
    return await SharedPrefManager.getString(userIdKey);
  }

  Future<void> setFcm(String value) async {
    await SharedPrefManager.setString(fcm, value);
  }

  Future<String?> getFcm() async {
    return await SharedPrefManager.getString(fcm);
  }
}
