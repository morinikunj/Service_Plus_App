import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/utils/constants/app_constants.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

import 'dio_services/dio_client.dart';

class ServiceProviderService {
  late final DioClient dio;

  ServiceProviderService() {
    dio = DioClient();
  }

  //get profile
  Future<ServiceProviderProfileDetails?>
      getServiceProviderProfileDetails() async {
    try {
      final email = await SessionManager().getEmail();
      var url = ApiEndPoints.serviceProviderProfile;
      final response = await dio.get("$url/$email");
      if (response.statusCode == 200) {
        return ServiceProviderProfileDetails.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
       return null;
    }
  }

  Future<ServiceProviderProfileDetails?>
      updateServiceProviderProfileDetails(data) async {
    try {
      final email = await SessionManager().getEmail();
      var url = ApiEndPoints.updateServiceProviderProfile;
      final response = await dio.put("$url/$email", data);
      if (response.statusCode == 200) {
        return ServiceProviderProfileDetails.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
       return null;
    }
  }
}
