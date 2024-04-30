import 'package:service_plus_app/models/response/wallet_response.dart';
import 'package:service_plus_app/offline_repository/db_helper.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/constants/app_constants.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class PaymentServices {
  late final DioClient dio;
  PaymentServices() {
    dio = DioClient();
  }

  //wallet
  Future<WalletResponse?> getWalletResponse() async {
    try {
      var userId = await SessionManager().getUserId();
      var url = ApiEndPoints.wallet;
      final response = await dio.get("$url/$userId");
      print("data : ${response.data}");
      if (response.statusCode == 200) {
        return WalletResponse.fromJson(response.data);
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
      }
    } catch (e) {
      Customdialog.showError(e.toString());
    }
    return null;
  }

  //transaction
  Future<void> transaction( data) async {
    try {
      final email = await SessionManager().getEmail();
      var url = ApiEndPoints.transaction;
      final response = await dio.post("$url/$email", data);
      if (response.statusCode == 200) {
        final msg = response.data["msg"];
        Customdialog.showSuccess(msg.toString());
      } else {
        final msg = response.data["error"];
        Customdialog.showError(msg);
      }
    } catch (e) {
      Customdialog.showError(e.toString());
    }
  }
}
