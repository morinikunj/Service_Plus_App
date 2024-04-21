import 'package:service_plus_app/services/dio_services/dio_client.dart';

class UserServices {
  late final DioClient _dio;
  UserServices() {
    _dio = DioClient();
  }
}
