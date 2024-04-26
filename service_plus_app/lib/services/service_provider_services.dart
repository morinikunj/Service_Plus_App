import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';

import 'dio_services/dio_client.dart';

class ServiceProviderService {
  late final DioClient dio;

  ServiceProviderService() {
    dio = DioClient();
  }

  //get profile
  Future<ServiceProviderProfileDetails?> getServiceProviderProfileDetails(
      email) async {
    try {
      var url = ApiEndPoints.serviceProviderProfile;
      final response = await dio.get("$url/$email");
      if (response.statusCode == 200) {
        return ServiceProviderProfileDetails.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
