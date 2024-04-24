import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/login/login_controller.dart';
import 'package:service_plus_app/pages/customer/register/register_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "register",
      init: RegisterController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  createAccount,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.whiteColor),
                  textScaler: textScale(context),
                  textAlign: TextAlign.left,
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
                      "$alreadyHaveAccount?",
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
                      onTap: controller.loginButtonClick,
                      child: Text(
                        login,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.yellowColor),
                        textScaler: textScale(context),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget form(BuildContext context, RegisterController controller) {
    return customContainer(
        color: AppColors.whiteColor.withOpacity(0.2),
        borderRadius: 20,
        padding: commonSysmPadding(context, horizontal: 10, vertical: 10),
        width: double.infinity,
        child: Form(
          key: controller.key,
          child: Column(
            children: [
              commonTextField(
                  hintTextColor: AppColors.accentColor,
                  prefixIcon: Icon(
                    AppIcons.userIcon,
                    size: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context),
                    color: AppColors.yellowColor,
                  ),
                  hintText: name,
                  controller: controller.nameTC,
                  validator: controller.nameValidate,
                  fill: false),
              SizedBox(
                height: ResponsiveUtil.height(20, context),
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
              Transform.translate(
                offset: const Offset(0, 30),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: controller.register,
                        child: Text(
                          register.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.whiteColor),
                          textScaler: textScale(context),
                        ))),
              )
            ],
          ),
        ));
  }
}
