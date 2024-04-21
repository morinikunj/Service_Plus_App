import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/profile/profile_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "profile",
      init: ProfileController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(context),
              SizedBox(height: ResponsiveUtil.height(10, context)),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return itemCard(
                      context,
                      title: controller.data[index]["title"],
                      icon: controller.data[index]["icon"],
                      onPressed: controller.data[index]["onpress"] ?? () {},
                    );
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveUtil.height(10, context),
              ),
              logoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        isGradient: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 40 * ResponsiveUtil.instance.textScaleFactor(context),
                backgroundColor: AppColors.yellowColor,
              ),
              title: Text(
                "Robin Hood",
                style: Theme.of(context).textTheme.titleMedium,
                textScaler: textScale(context),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    AppIcons.emailIcon,
                    size: 18 * ResponsiveUtil.instance.textScaleFactor(context),
                    color: AppColors.secondaryColor,
                  ),
                  Text(
                    "abc123@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall,
                    textScaler: textScale(context),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget itemCard(
    BuildContext context, {
    String? title,
    IconData? icon,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: commonSysmPadding(context, horizontal: 15, vertical: 0),
      child: Card(
        child: ListTile(
          leading: Icon(
            icon,
            size: GeneralSize.iconSize *
                ResponsiveUtil.instance.textScaleFactor(context),
            color: AppColors.greyColor,
          ),
          title: Text(
            title ?? "",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.blackColor),
            textScaler: textScale(context),
          ),
          trailing: Icon(
            AppIcons.rightArraw,
            size: GeneralSize.iconSize *
                ResponsiveUtil.instance.textScaleFactor(context),
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }

  Widget customSpacer(BuildContext context) {
    return SizedBox(
      height: ResponsiveUtil.height(15, context),
    );
  }

  Widget logoutButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          logout.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.whiteColor),
          textScaler: textScale(context),
        ),
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(AppColors.redColor)));
  }
}
