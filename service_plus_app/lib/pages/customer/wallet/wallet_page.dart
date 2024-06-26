import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/empty_data_widget.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/pages/customer/wallet/scanner_page.dart';
import 'package:service_plus_app/pages/customer/wallet/wallet_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class WalletPage extends StatefulWidget {
  WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  WalletController controller = Get.put(WalletController());
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, controller.handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, controller.handlePaymentError);
    _razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, controller.handleExternalWallet);
  }



  

  void startPayment() {
    var options = {
      'key': 'rzp_test_Z6xgCsCR7f4nbT', // Replace with your Razorpay API key
      'amount': int.tryParse(controller.amountTC.text.toString())! *
          100, // amount in the smallest currency unit
      'description': '',
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }



  Widget paymentWidget() {
    return Form(
      key: controller.key,
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        child: Column(
          children: [
            Text(
              addNewAddress,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.greyColor),
              textScaler: textScale(context),
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            commonTextField(
              fontSize: GeneralSize.textsize6,
              controller: controller.payAmtTC,
              hintText: title,
              padding: commonSysmPadding(context, horizontal: 10, vertical: 1),
              validator: controller.validater,
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      startPayment();
                      controller.amountTC.clear();
                      Get.back();
                    }
                  },
                  child: Text(
                    submit,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.whiteColor),
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            header(context, controller),
            Expanded(
                child: Transform.translate(
                    offset: Offset(0, ResponsiveUtil.height(-5, context)),
                    child: body(context, controller)))
          ],
        );
      })),
    );
  }

  Widget header(BuildContext context, WalletController controller) {
    print("data : ${controller.wallet!.wallet!.balance}");
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backButton(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: ResponsiveUtil.width(30, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rs ${controller.wallet!.wallet!.balance}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.secondaryColor),
                        textScaler: textScale(context),
                      ),
                      Text(
                        avilableBalance,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.greyColor.withOpacity(0.5)),
                        textScaler: textScale(context),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(200, context),
                  width: ResponsiveUtil.width(120, context),
                  child: Image.asset(
                    AppImage.walletImg,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget body(BuildContext context, WalletController controller) {
    return Column(
      children: [
        customContainer(
            padding: commonSysmPadding(context, horizontal: 24, vertical: 20),
            width: double.infinity,
            borderRadius: 20,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      AppIcons.downArrowIcon,
                      size: GeneralSize.iconMedium *
                          ResponsiveUtil.instance.textScaleFactor(context),
                      color: AppColors.accentColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Add Money", content: addMoneyWidget());
                      },
                      child: Text(
                        addMoney,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.accentColor),
                        textScaler: textScale(context),
                      ),
                    ),
                    customContainer(
                        width: 1.5,
                        color: AppColors.accentColor.withOpacity(0.5)),
                    Icon(
                      AppIcons.upArrowIcon,
                      size: GeneralSize.iconMedium *
                          ResponsiveUtil.instance.textScaleFactor(context),
                      color: AppColors.accentColor,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(SacnnerPage());
                      },
                      child: Text(
                      "payment",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.accentColor),
                      textScaler: textScale(context),
                    ),
                    )
                  ],
                ),
                SizedBox(
                  height: ResponsiveUtil.height(10, context),
                )
              ],
            )),
        Expanded(
          child: Transform.translate(
              offset: Offset(0, ResponsiveUtil.height(-25, context)),
              child: customContainer(
                borderRadius: 20,
                color: AppColors.whiteColor,
                padding:
                    commonSysmPadding(context, horizontal: 24, vertical: 18),
                child: controller.wallet!.wallet!.transactions!.isEmpty
                    ? emptyDataWidget(context, "No Transactions Avilable")
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return itemCard(
                              context,
                              "",
                              controller.wallet!.wallet!.transactions![index]
                                  .description
                                  .toString(),
                              controller
                                  .wallet!.wallet!.transactions![index].amount
                                  .toString(),
                              controller
                                  .wallet!.wallet!.transactions![index].date!
                                  .toString(),
                              type: controller
                                  .wallet!.wallet!.transactions![index].type!);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: ResponsiveUtil.height(15, context),
                            thickness: 1,
                            color: AppColors.chatBubbleColor,
                          );
                        },
                        itemCount:
                            controller.wallet!.wallet!.transactions!.length ??
                                0),
              )),
        )
      ],
    );
  }

  Widget addMoneyWidget() {
    return customContainer(
        child: Column(
      children: [
        Form(
          key: controller.formKey,
          child: commonTextField(
              controller: controller.amountTC,
              hintText: "Enter amount",
              validator: controller.validater,
              keyboardType: TextInputType.number),
        ),
        SizedBox(
          height: ResponsiveUtil.height(15, context),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                 if (controller.formKey.currentState!.validate()) {
      startPayment();
    controller.amountTC.clear();
      Get.back();
    }
              },
              child: Text(
                submit,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.whiteColor),
              )),
        )
      ],
    ));
  }

  Widget itemCard(
      context, String title, String subtitle, String amount, String time,
      {bool recevied = false, String type = "add"}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
              textScaler: textScale(context),
            ),
            Text(
              "Rs $amount",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: type == "add"
                      ? AppColors.greenColor
                      : AppColors.redColor),
              textScaler: textScale(context),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
              textScaler: textScale(context),
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.greyColor,
                  ),
              textScaler: textScale(context),
            )
          ],
        )
      ],
    );
  }
}
