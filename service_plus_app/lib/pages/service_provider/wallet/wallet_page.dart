import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/empty_data_widget.dart';
import 'package:service_plus_app/components/error_widget.dart';
import 'package:service_plus_app/components/loading_widget.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/models/response/wallet_response.dart';
import 'package:service_plus_app/pages/customer/wallet/wallet_controller.dart';
import 'package:service_plus_app/pages/service_provider/wallet/wallet_controller.dart';
import 'package:service_plus_app/services/payment_services.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProviderWalletPage extends StatelessWidget {
  ProviderWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: SafeArea(
        child: FutureBuilder(
          future: PaymentServices().getWalletResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  header(context, snapshot.data),
                  Expanded(
                      child: Transform.translate(
                          offset: Offset(0, ResponsiveUtil.height(-5, context)),
                          child: body(context, snapshot.data)))
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return loadingWidget();
            } else if (snapshot.hasError) {
              return errorWidget(context, snapshot.error);
            }
            return noDataFound(context);
          },
        ),
      )),
    );
  }

  Widget header(BuildContext context, WalletResponse? wallet) {
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
                        wallet!.wallet!.balance.toString(),
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

  Widget body(BuildContext context, WalletResponse? walletResponse) {
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
                    Text(
                      addMoney,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.accentColor),
                      textScaler: textScale(context),
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
                    Text(
                      sendMoney,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.accentColor),
                      textScaler: textScale(context),
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
              padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
              child: walletResponse!.wallet!.transactions!.isEmpty
                  ? emptyDataWidget(context, "No Transactions Avilable")
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return itemCard(
                          context,
                          "Robin Hood",
                          "cleanig",
                          "200",
                          "20/05/2024",
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: ResponsiveUtil.height(15, context),
                          thickness: 1,
                          color: AppColors.chatBubbleColor,
                        );
                      },
                      itemCount: 10),
            ),
          ),
        )
      ],
    );
  }

  Widget itemCard(
      context, String title, String subtitle, String amount, String time,
      {bool recevied = false}) {
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
                  color: recevied ? AppColors.greenColor : AppColors.redColor),
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
