import 'package:dio/dio.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

//* Request methods PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as token.
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await SessionManager().getToken();

    if (token != null && token.isNotEmpty) {
      options.headers["x-auth-token"] = token;
    }

    options.headers["Content-Type"] = "application/json";

    super.onRequest(options, handler);
  }
}
