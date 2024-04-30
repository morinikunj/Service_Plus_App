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

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int currentIndex = 0;
  List times = ["One", "Week", "Month"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              body(context),
            ],
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(context),
              ],
            ),
            customContainer(
              borderRadius: 100,
              padding: EdgeInsets.zero,
              border: Border.all(color: AppColors.whiteColor, width: 3),
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
          ],
        ));
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customInputField(context,
              title: place,
              icon: AppIcons.locationIcon,
              iconColor: AppColors.secondaryColor,
              onPressed: () {}),
          customSpacer(context),
          customInputField(context,
              title: selectServices,
              icon: AppIcons.serviceIcon,
              onPressed: () {}),
          customSpacer(context),
          customInputField(context,
              title: howMuchTimes,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(times.length, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: customContainer(
                          borderRadius: 20,
                          color: currentIndex != index
                              ? AppColors.whiteColor
                              : AppColors.secondaryColor,
                          child: Text(
                            times[index],
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: currentIndex == index
                                        ? AppColors.whiteColor
                                        : AppColors.secondaryColor),
                          )),
                    );
                  }).toList()
                ],
              )),
          customSpacer(context),
          customInputField(context,
              title: selectDate,
              icon: AppIcons.bookingIcon,
              onPressed: () {},
              iconColor: AppColors.secondaryColor),
          customSpacer(context),
          Row(
            children: [
              Expanded(
                child: customInputField(
                  context,
                  title: startTime,
                  icon: AppIcons.clockIcon,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: ResponsiveUtil.width(10, context),
              ),
              Expanded(
                child: customInputField(
                  context,
                  title: startTime,
                  icon: AppIcons.clockIcon,
                  onPressed: () {},
                ),
              )
            ],
          ),
          customSpacer(context),
          customSpacer(context),
          SizedBox(
            width: double.infinity,
            child: customElevatedButton(
              context,
              child: Text(
                proceedToPay.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.whiteColor),
                textScaler: textScale(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customInputField(BuildContext context,
      {String? title,
      IconData? icon,
      Color? iconColor,
      TextEditingController? controller,
      VoidCallback? onPressed,
      Widget? child,
      bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.greyColor),
          textScaler: textScale(context),
        ),
        SizedBox(
          height: ResponsiveUtil.height(10, context),
        ),
        child ??
            commonTextField(
                hintText: title ?? "",
                controller: controller,
                obscureText: isPassword,
                padding:
                    commonSysmPadding(context, horizontal: 10, vertical: 5),
                suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      icon,
                      color: iconColor ?? AppColors.blackColor,
                      size: GeneralSize.iconSize *
                          ResponsiveUtil.instance.textScaleFactor(context),
                    )))
      ],
    );
  }

  Widget customSpacer(BuildContext context) {
    return SizedBox(
      height: ResponsiveUtil.height(20, context),
    );
  }
}
