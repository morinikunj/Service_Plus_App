import 'package:service_plus_app/models/response/wallet_response.dart';
import 'package:service_plus_app/services/api_endpoints_constants.dart';
import 'package:service_plus_app/services/dio_services/dio_client.dart';
import 'package:service_plus_app/utils/constants/app_constants.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';

class PaymentServices {
  late final DioClient dio;
  PaymentServices() {
    dio = DioClient();
  }

  //wallet
  Future<WalletResponse?> getWalletResponse() async {
    try {
      final email = AppConstant.userEmail;
      var url = ApiEndPoints.wallet;
      final response = await dio.get("$url/$email");
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
  Future<void> transaction(Transactions data) async {
    try {
      final email = AppConstant.userEmail;
      var url = ApiEndPoints.transaction;
      final response = await dio.post("$url/$email", data.toJson());
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
