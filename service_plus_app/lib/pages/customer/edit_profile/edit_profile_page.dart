import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        child: Row(
          children: [
            backButton(context),
            Center(
              child: Text(
                editProfile,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.secondaryColor),
                textScaler: textScale(context),
              ),
            )
          ],
        ));
  }

  Widget editImage() {
    return Column(
      children: [
        customContainer(
            borderRadius: 100,
            border: Border.all(
                color: AppColors.whiteColor,
                width: 2 * ResponsiveUtil.instance.textScaleFactor(context)),
            child: CircleAvatar(
              radius: 80 * ResponsiveUtil.instance.textScaleFactor(context),
              backgroundColor: AppColors.greenColor,
            )),
        Transform.translate(
          offset: Offset(0, ResponsiveUtil.height(-30, context)),
          child: customContainer(
              borderRadius: 100,
              border: Border.all(
                  color: AppColors.whiteColor,
                  width: 1 * ResponsiveUtil.instance.textScaleFactor(context)),
              child: Center(
                child: Icon(
                  AppIcons.imgIcon,
                  size: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
              )),
        )
      ],
    );
  }

  Widget form(BuildContext context) {
    return Column(
      children: [
        detailsInput(
          context,
          title: name,
        ),
        SizedBox(
          height: ResponsiveUtil.height(20, context),
        ),
        detailsInput(
          context,
          title: email,
        ),
        SizedBox(
          height: ResponsiveUtil.height(20, context),
        ),
        detailsInput(
          context,
          title: no,
        ),
      ],
    );
  }

  Widget detailsInput(BuildContext context,
      {String? title, TextEditingController? controller}) {
    return Column(
      children: [
        Text(
          title ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.greyColor),
          textScaler: textScale(context),
        ),
        SizedBox(
          height: ResponsiveUtil.height(10, context),
        ),
        commonTextField(
            controller: controller,
            hintText: title,
            padding: commonSysmPadding(context, horizontal: 20, vertical: 10))
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return customElevatedButton(context,
        child: Text(
          updateProfile.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall,
          textScaler: textScale(context),
        ));
  }
}
