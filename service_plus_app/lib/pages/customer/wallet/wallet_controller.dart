import 'package:get/get.dart';
import 'package:service_plus_app/models/response/wallet_response.dart';
import 'package:service_plus_app/services/payment_services.dart';

class WalletController extends GetxController {
  WalletResponse? wallet;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchWalletData();
    super.onInit();
  }

  fetchWalletData() async {
    try {
      isLoading.value = true;
      var walletResponse = await PaymentServices().getWalletResponse();
      print("data : ${walletResponse!.wallet!.balance}");
      if (walletResponse.wallet != null) {
        wallet = walletResponse;
      }
    } on Exception catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}
