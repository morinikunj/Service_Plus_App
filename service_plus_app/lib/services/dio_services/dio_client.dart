import 'package:dio/dio.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/interceptors/auth_interceptors.dart';

class DioClient {
  DioClient()
      : dio = Dio(BaseOptions(
            baseUrl: ApiEndPoints.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            responseType: ResponseType.json))
          ..interceptors.addAll([AuthorizationInterceptor(), LogInterceptor()]);

  final Dio dio;
}
