import 'package:service_plus_app/models/response/booking_details_response.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

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
        print(response.data);
        print("success...");
      } else {
        final msg = response.data["error"];
        print("error : $msg");
      }
    } catch (e) {
      print(e);
    }
  }

  //get bookings
  Future<List<BookingDetailsResponse>?> getBookingsDetails() async {
    try {
      var id = await SessionManager().getUserId();
      var url = ApiEndPoints.bookings;
      final response = await dio.get("$url/$id");
      if (response.statusCode == 200) {
       List<dynamic> data = response.data;
       return data.map((data){
       return BookingDetailsResponse.fromJson(data);
       }).toList();
      }
      else {
        final msg = response.data["error"];
        return msg;
      }
    } catch (e) { print("$e");
      return [];
    }
  }
}