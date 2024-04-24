import 'package:service_plus_app/utils/local_storage/share_pref_manager.dart';

class SessionManager {
  // final SessionManager _instance = SessionManager._();
  // SessionManager get instance => _instance;
  // SessionManager._();

  final String tokenKey = "TOKEN";

  Future<void> setToken(String value) async {
    await SharedPrefManager.setString(tokenKey, value);
  }

  Future<String?> getToken() async {
    return await SharedPrefManager.getString(tokenKey);
  }
}
