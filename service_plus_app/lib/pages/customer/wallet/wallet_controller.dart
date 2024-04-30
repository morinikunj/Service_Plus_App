import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:service_plus_app/models/response/wallet_response.dart';
import 'package:service_plus_app/pages/customer/bottom_navbar/bottom_navbar_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/services/payment_services.dart';
import 'package:service_plus_app/utils/dialog_util/custom_dialog.dart';

class WalletController extends GetxController {
  WalletResponse? wallet;
  var isLoading = true.obs;
  late Razorpay _razorpay;
  TextEditingController amountTC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  BottomNavbarController bottomBar = Get.find();

  @override
  void onInit() {
    fetchWalletData();
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  fetchWalletData() async {
    try {
      isLoading.value = true;
      var walletResponse = await PaymentServices().getWalletResponse();
      print("data : ${walletResponse!.wallet!.balance}");
      if (walletResponse.wallet != null) {
        wallet = walletResponse;
      }
    } finally {
      isLoading.value = false;
    }
  }

  void startPayment() {
    var options = {
      'key': 'rzp_test_Z6xgCsCR7f4nbT', // Replace with your Razorpay API key
      'amount': int.tryParse(amountTC.text.toString())! * 100, // amount in the smallest currency unit
      'description': '',
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  String? validater(value){
    if (value == null || value == "") {
      return "Please enter amount";
    }
  }

  gotoNavbar(){
    bottomBar.currentPage = 0;
    Get.offAndToNamed(  AppRoutes.bottomNavbar);
  }

  submit(){
    if (formKey.currentState!.validate()) {
      startPayment();
      amountTC.clear();
      Get.back();
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) {
    
    Get.snackbar("Payment Successfull","");
  }

  _handlePaymentError() {
     gotoNavbar();
     Get.snackbar("Payment Successfull","");
    
  }

  addToWallet() async {
    Map<String, dynamic> data = {
      "type": "add",
      "description": "Money added",
      "amount": int.tryParse(amountTC.text.toString()),
      "recipient": "Add Money"
    };
    try {
      await PaymentServices().transaction(jsonEncode(data));
    } catch (e) {
      
    }
  }

  _handleExternalWallet() {
    gotoNavbar();
     Get.snackbar("Payment Successfull","");
  }
}
