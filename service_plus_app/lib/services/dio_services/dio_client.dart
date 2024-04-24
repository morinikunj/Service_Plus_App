import 'package:dio/dio.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/interceptors/auth_interceptors.dart';

class DioClient {
  DioClient()
      : _dio = Dio(BaseOptions(
            baseUrl: ApiEndPoints.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            responseType: ResponseType.json))
          ..interceptors.addAll([AuthorizationInterceptor(), LogInterceptor()]);

  late final Dio _dio;

  //GET method
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  //POST method
  Future<Response> post(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  //PUT method
  Future<Response> put(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }

  //DELETE method
  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
