import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/change_password/change_password_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return GetBuilder(
      init: ChangePasswordController(),
      builder: (controller) {
        return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formkey,
          child: Column(
            children: [
              header(context),
              Padding(
                padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
                child: Container(
                  child: Column(
                    children: [
                       commonTextField(
                        validator: controller.validater,
                hintText: 'Enter Old Password',
                padding: commonSysmPadding(context, horizontal: 20, vertical: 10)),
                SizedBox(
                  height: ResponsiveUtil.height(25, context),
                ),
                commonTextField(
                  validator: controller.validater,
                hintText: 'Enter New Password',
                padding: commonSysmPadding(context, horizontal: 20, vertical: 10)),
                SizedBox(
                  height: ResponsiveUtil.height(25, context),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: controller.submit, child: Text(
                "submit".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.whiteColor),
                textScaler: textScale(context),
              )),
                )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
      },
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            backButton(context),
            SizedBox(
              width: ResponsiveUtil.width(20, context),
            ),
            Text(
              "Change Password",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.secondaryColor),
              textAlign: TextAlign.center,
              textScaler: textScale(context),
            )
          ],
        ));
  }

}