import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/loading_widget.dart';
import 'package:service_plus_app/pages/customer/edit_profile/edit_profile_controller.dart';
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
  EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "edit_profile",
      init: EditProfileController(),
      builder: (controller) {
        return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              SizedBox(
                height: ResponsiveUtil.height(30, context),
              ),
              editImage(context),
              form(context),
              submitButton(context)
            ],
          ),
        ),
      ),
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
              editProfile,
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

  Widget editImage(BuildContext context,) {
    return Column(
      children: [
        customContainer(
            borderRadius: 100,
            padding: EdgeInsets.zero,
            border: Border.all(
                color: AppColors.whiteColor,
                width: 3 * ResponsiveUtil.instance.textScaleFactor(context)),
            child:  controller.file != null ?  CircleAvatar(
              radius: 80 * ResponsiveUtil.instance.textScaleFactor(context),
              backgroundColor: AppColors.greenColor,
             backgroundImage: FileImage(controller.file!)
            ) :  CircleAvatar(
              radius: 80 * ResponsiveUtil.instance.textScaleFactor(context),
              backgroundColor: AppColors.greenColor,
             backgroundImage: NetworkImage(controller.profileImg, scale: 1.0)
            )
            ),
        Transform.translate(
          offset: Offset(ResponsiveUtil.width(55, context),
              ResponsiveUtil.height(-60, context)),
          child: IconButton(
            onPressed: () {
              controller.onPickImage(context);
            },
            style: IconButton.styleFrom(
                backgroundColor: AppColors.yellowColor,
                side: BorderSide(color: AppColors.whiteColor, width: 3)),
            icon: Icon(
              AppIcons.imgIcon,
              size: GeneralSize.iconSize *
                  ResponsiveUtil.instance.textScaleFactor(context),
            ),
          ),
        )
      ],
    );
  }

  Widget form(BuildContext context) {
    return Padding(
      padding: commonSysmPadding(context, horizontal: 24, vertical: 0),
      child: Form(
        key: controller.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsInput(
              controller: controller.nameTC,
              context,
              title: name,
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            detailsInput(
              controller: controller.emailTC,
              context,
              title: email,
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            detailsInput(
              controller: controller.phoneNoTC,
              context,
              title: no,
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsInput(BuildContext context,
      {String? title, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    return Padding(
      padding: commonSysmPadding(context, horizontal: 24, vertical: 30),
      child: SizedBox(
        width: double.infinity,
        child: Obx((){
          return controller.isLoading.value == true ? ElevatedButton(
            onPressed: () {
              controller.sumit();
            },
            child: Text(
              updateProfile.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.whiteColor),
              textScaler: textScale(context),
            )) : loadingWidget();
        })
      ),
    );
  }
}
