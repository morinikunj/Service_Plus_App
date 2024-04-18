import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          child: Column(
            children: [header(context), reviewCard(context)],
          ),
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
                  icon: Icon(
                    AppIcons.chatIcon,
                    color: AppColors.whiteColor,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  iconSize: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                )
              ],
            ),
            customContainer(
              padding: EdgeInsets.zero,
              borderRadius: 100,
              border: Border.all(color: AppColors.whiteColor, width: 3),
              child: CircleAvatar(
                backgroundColor: AppColors.yellowColor,
                radius: 60 * ResponsiveUtil.instance.textScaleFactor(context),
              ),
            ),
            SizedBox(
              height: ResponsiveUtil.height(10, context),
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
              mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: ResponsiveUtil.height(10, context),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.locationIcon,
                  color: AppColors.redColor,
                  size: GeneralSize.iconSize *
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
            SizedBox(
              height: ResponsiveUtil.height(3, context),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.timeIcon,
                  color: AppColors.blackColor,
                  size: GeneralSize.iconSize *
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
            SizedBox(
              height: ResponsiveUtil.height(3, context),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.experienceIcon,
                  color: AppColors.primaryColor,
                  size: GeneralSize.iconSize *
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
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      book,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.whiteColor),
                      textScaler: textScale(context),
                    ),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.yellowColor)),
                  ),
                ),
                SizedBox(
                  width: ResponsiveUtil.width(20, context),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        call,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.whiteColor),
                        textScaler: textScale(context),
                      )),
                )
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
              maxLines: 2,
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
