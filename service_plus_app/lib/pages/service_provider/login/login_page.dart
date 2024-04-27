import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/models/response/login_response.dart';
import 'package:service_plus_app/pages/customer/login/login_controller.dart';
import 'package:service_plus_app/pages/service_provider/login/login_controller.dart';
import 'package:service_plus_app/services/auth_services.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProviderLoginPage extends StatelessWidget {
  const ProviderLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "provider_login",
      init: ProviderLoginController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                Image.asset(
                  AppImage.loginImg,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  width: double.infinity,
                  height: ResponsiveUtil.height(
                    200,
                    context,
                  ),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                form(context, controller),
                SizedBox(
                  height: ResponsiveUtil.height(40, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$createAccount?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.whiteColor),
                      textScaler: textScale(context),
                    ),
                    SizedBox(
                      width: ResponsiveUtil.width(5, context),
                    ),
                    InkWell(
                      onTap: controller.registerButtonClick,
                      child: Text(
                        register,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.yellowColor),
                        textScaler: textScale(context),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget form(BuildContext context, ProviderLoginController controller) {
    return customContainer(
        color: AppColors.whiteColor.withOpacity(0.2),
        borderRadius: 20,
        padding: commonSysmPadding(context, horizontal: 10, vertical: 20),
        width: double.infinity,
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              Text(
                login.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.whiteColor),
                textScaler: textScale(context),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: ResponsiveUtil.height(10, context),
              ),
              Divider(
                height: ResponsiveUtil.height(10, context),
                thickness: 1,
                color: AppColors.accentColor.withOpacity(0.5),
              ),
              commonTextField(
                  hintTextColor: AppColors.accentColor,
                  prefixIcon: Icon(
                    AppIcons.emailIcon,
                    size: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context),
                    color: AppColors.yellowColor,
                  ),
                  hintText: email,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailTC,
                  validator: controller.emailValidate,
                  fill: false),
              SizedBox(
                height: ResponsiveUtil.height(20, context),
              ),
              commonTextField(
                  hintTextColor: AppColors.accentColor,
                  prefixIcon: Icon(
                    AppIcons.passwordIcon,
                    size: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context),
                    color: AppColors.yellowColor,
                  ),
                  hintText: password,
                  controller: controller.passwordTC,
                  validator: controller.passwordValidate,
                  obscureText: controller.isVisible,
                  suffixIcon: IconButton(
                    onPressed: controller.passwordVisible,
                    icon: Icon(controller.isVisible
                        ? AppIcons.visibleOffPassIcon
                        : AppIcons.visiblePassIcon),
                    color: AppColors.yellowColor,
                    iconSize: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context),
                  ),
                  fill: false),
              SizedBox(
                height: ResponsiveUtil.height(20, context),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: controller.forgetPassword,
                  child: Text(
                    forgetPassword,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.yellowColor),
                    textScaler: textScale(context),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Transform.translate(
                  offset: Offset(0, ResponsiveUtil.height(35, context)),
                  child: SizedBox(
                    width: double.infinity,
                    child: controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.accentColor,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              controller.login();
                            },
                            child: Text(
                              login.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColors.whiteColor),
                              textScaler: textScale(context),
                            ),
                          ),
                  )),
            ],
          ),
        ));
  }
}
