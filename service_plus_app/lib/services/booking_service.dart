import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';

class BookingService {
  late final DioClient dio;
  BookingService(){
    dio = DioClient();
  }

  Future<void> bookService(data) async {
    try {
      var url = ApiEndPoints.bookService;
      final response = await dio.post(url, data);
      if (response.statusCode == 200) {
        print("success...");
      } else {
        final msg = response.data["error"];
        print("error : $msg");
      }
    } catch (e) {
      print(e);
    }
  }
}