import 'package:flutter/material.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ExpertDetailsPage extends StatelessWidget {
  const ExpertDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                backButton(context),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(AppIcons.chatIcon),
                  iconSize: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                )
              ],
            ),
            customContainer(
              border: Border.all(color: AppColors.whiteColor, width: 1.5),
              child: CircleAvatar(
                backgroundColor: AppColors.yellowColor,
                radius: 60 * ResponsiveUtil.instance.textScaleFactor(context),
              ),
            ),
            Text(
              "Robin Hood",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.ratingIcon,
                  color: AppColors.yellowColor,
                  size: GeneralSize.iconSmall *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  "5.0",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  width: ResponsiveUtil.width(10, context),
                ),
                Text(
                  "Rs. 200/day",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  AppIcons.locationIcon,
                  color: AppColors.redColor,
                  size: GeneralSize.iconSmall *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  location,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  "Ahmedabad, Gujarat",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  AppIcons.timeIcon,
                  color: AppColors.blackColor,
                  size: GeneralSize.iconSmall *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  timing,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  "09:00 AM to 06:00 PM",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  AppIcons.experienceIcon,
                  color: AppColors.primaryColor,
                  size: GeneralSize.iconSmall *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  experience,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  "5 Years",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            SizedBox(
              height: ResponsiveUtil.height(10, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    book,
                    style: Theme.of(context).textTheme.titleSmall,
                    textScaler: textScale(context),
                  ),
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.yellowColor)),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      call,
                      style: Theme.of(context).textTheme.titleSmall,
                      textScaler: textScale(context),
                    ))
              ],
            )
          ],
        ));
  }

  Widget reviewCard(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.yellowColor,
          radius: GeneralSize.iconSize *
              ResponsiveUtil.instance.textScaleFactor(context),
        ),
        title: Row(
          children: [
            Text(
              "Robin hood",
              style: Theme.of(context).textTheme.labelSmall,
              textScaler: textScale(context),
            ),
            const Spacer(),
            Icon(
              AppIcons.ratingIcon,
              color: AppColors.yellowColor,
              size: GeneralSize.iconSmall *
                  ResponsiveUtil.instance.textScaleFactor(context),
            ),
            Text(
              "5.0",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.greyColor),
              textScaler: textScale(context),
            )
          ],
        ),
        subtitle: Text(
          desc,
          style: Theme.of(context).textTheme.displaySmall,
          textScaler: textScale(context),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

String desc =
    "The legal status of women in the United States is, in comparison to other countries, equal to that of men.";
