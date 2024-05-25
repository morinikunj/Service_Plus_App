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
 // late Razorpay _razorpay;
  TextEditingController amountTC = TextEditingController();
  final formKey = GlobalKey<FormState>();
   final key = GlobalKey<FormState>();
  BottomNavbarController bottomBar = Get.find();
  TextEditingController payAmtTC = TextEditingController();
   var payUserId;

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
    } finally {
      isLoading.value = false;
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

 
  handlePaymentSuccess(PaymentSuccessResponse response) {
    handlePayment();
    Get.snackbar("Payment Successfull","");
  }

  handlePaymentError() {
     gotoNavbar();
     Get.snackbar("Payment Unsuccessfull","");
    
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

  handlePayment() async {
   try {
      Map<String, dynamic> data = {
      "type": "add",
      "description": "Added funds to wallet",
      "amount": amountTC.text,
      "recipient": "for services"
    };
   await PaymentServices().transaction(jsonEncode(data));
   } catch (e) {
     
   }
  }

 

  handleExternalWallet() {
    gotoNavbar();
     Get.snackbar("Payment Successfull","");
  }
}
