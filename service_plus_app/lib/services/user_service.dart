import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/models/response/user_profile_response.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class UserService {
  late final DioClient dio;

  UserService() {
    dio = DioClient();
  }


  Future<void> updateProfile(data) async {
    try {
      var url = ApiEndPoints.updateProfile;
      final response = await dio.put(url, data);
      if (response.statusCode == 200) {
        final msg = response.data["msg"];
        Customdialog.showSuccess(msg);
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
      }
    } catch (e) {
      Customdialog.showError(e);
    }
  }

  //fetch user profile
  Future<UserProfileResponse?> getUserProfile() async {
    try {
      final email = await SessionManager().getEmail();
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

  //get categories
  Future<CategoryResponse?> getCategories() async {
    try {
      var url = ApiEndPoints.categories;
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return CategoryResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  Future<List<ServiceProviderProfileDetails>?> getServiceProviderList(
      String service) async {
    try {
      var url = ApiEndPoints.getAllServiceProvider;
      final response = await dio.get("$url/$service");
      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map((e) => ServiceProviderProfileDetails.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } on Exception catch (e) {
      return null;
    }
  }


  Future<String?> uploadImage(File imageFile) async {
    try {
      String uploadPreset = 'z8cnbvgo'; // Set your Cloudinary upload preset
      String url = 'https://api.cloudinary.com/v1_1/serviceplus/image/upload';

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'upload_preset': uploadPreset,
      });

      Dio dio = Dio();
     final response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url'];
      } else {
        print('Upload failed: ${response.data}');
        return null;
      }
    } catch (error) {
      print('Error uploading image: $error');
      return null;
    }
  }


}
