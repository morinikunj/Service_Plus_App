import 'package:flutter/material.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class UserBookingDetailsPage extends StatelessWidget {
  const UserBookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            header(context),
            body(context),

          ],
        ),
      ),
     // bottomNavigationBar: bottomsheet(context)
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        width: double.infinity,
        isGradient: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(alignment: Alignment.topLeft, child: backButton(context)),
            SizedBox(
              width: ResponsiveUtil.width(30, context),
            ),
            Text(
              "Bookings Details",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.secondaryColor,
                  ),
              textScaler: textScale(context),
            ),
          ],
        ));
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                
                    contentPadding: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(20, context)),
                    title: Text(
                      "Samarth Smit",
                      style: Theme.of(context).textTheme.titleSmall,
                      textScaler: textScale(context),
                    ),
                    subtitle: Text(
                      "Rs.200/hr",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.greyColor),
                      textScaler: textScale(context),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.yellowColor,
                      radius: GeneralSize.iconSize *
                          ResponsiveUtil.instance.textScaleFactor(context),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Flexible(
                  //       flex: 1,
                  //       child: TextButton(
                  //           onPressed: () {},
                  //           child: Row(
                  //             children: [
                  //               Icon(
                  //                 AppIcons.callIcon,
                  //                 size: GeneralSize.iconSize *
                  //                     ResponsiveUtil.instance
                  //                         .textScaleFactor(context),
                  //                 color: AppColors.primaryColor,
                  //               ),
                  //               Text(
                  //                 callNow,
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodySmall!
                  //                     .copyWith(
                  //                         color: AppColors.secondaryColor),
                  //                 textScaler: textScale(context),
                  //               )
                  //             ],
                  //           )),
                  //     ),
                  //     Flexible(
                  //       flex: 1,
                  //       child: TextButton(
                  //           onPressed: () {},
                  //           child: Row(
                  //             children: [
                  //               Icon(
                  //                 AppIcons.chatIcon,
                  //                 size: GeneralSize.iconSize *
                  //                     ResponsiveUtil.instance
                  //                         .textScaleFactor(context),
                  //                 color: AppColors.greenColor,
                  //               ),
                  //               Text(
                  //                 message,
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodySmall!
                  //                     .copyWith(color: AppColors.greenColor),
                  //                 textScaler: textScale(context),
                  //               )
                  //             ],
                  //           )),
                  //     ),
                  //     const Spacer(
                  //       flex: 1,
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveUtil.height(20, context),
            ),
            Text(
              bookingStatus,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.greyColor),
              textScaler: textScale(context),
            ),
            bookingStatusWidget(context)
          ],
        ),
      ),
    );
  }

  Widget bookingStatusWidget(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: GeneralSize.iconSize *
                    ResponsiveUtil.instance.textScaleFactor(context),
                backgroundColor: AppColors.greenColor,
                child: FittedBox(
                  child: Icon(
                    AppIcons.checkIcon,
                    size: 18 * ResponsiveUtil.instance.textScaleFactor(context),
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              customContainer(
                  width: 1,
                  height: ResponsiveUtil.height(20, context),
                  border: Border.all(
                    width: 1,
                    color: AppColors.greyColor,
                    style: BorderStyle.solid,
                  ))
            ],
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  requestRecieved,
                  style: Theme.of(context).textTheme.titleMedium,
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  "requested on 19 Jan, 2019 09:00 AM",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                trailing: customContainer(
                    height: ResponsiveUtil.height(60, context),
                    color: AppColors.primaryColor),
              ),
              ListTile(
                title: Text(
                  requestRecieved,
                  style: Theme.of(context).textTheme.titleMedium,
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  "requested on 19 Jan, 2019 09:00 AM",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                trailing: customContainer(
                    height: ResponsiveUtil.height(60, context),
                    color: AppColors.primaryColor),
              ),
              ListTile(
                title: Text(
                  requestRecieved,
                  style: Theme.of(context).textTheme.titleMedium,
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  "requested on 19 Jan, 2019 09:00 AM",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                trailing: customContainer(
                    height: ResponsiveUtil.height(60, context),
                    color: AppColors.primaryColor),
              ),
              ListTile(
                title: Text(
                  requestRecieved,
                  style: Theme.of(context).textTheme.titleMedium,
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  "requested on 19 Jan, 2019 09:00 AM",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                trailing: customContainer(
                    height: ResponsiveUtil.height(60, context),
                    color: AppColors.primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bottomsheet(BuildContext context){
    return customContainer(
          width: double.infinity,
          color: AppColors.primaryColor,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                 leading: CircleAvatar(
              backgroundColor: AppColors.yellowColor,
              radius: GeneralSize.iconSize *
                  ResponsiveUtil.instance.textScaleFactor(context),
            ),
            subtitle: Row(
            children: [
              Icon(
                AppIcons.bookingIcon,
                size: GeneralSize.iconSmall *
                    ResponsiveUtil.instance.textScaleFactor(context),
                color: AppColors.greyColor,
              ),
              Text(
                "09/05/2024",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.greyColor),
                textScaler: textScale(context),
              ),
              SizedBox(
                width: ResponsiveUtil.width(10, context),
              ),
              Icon(
                AppIcons.clockIcon,
                size: GeneralSize.iconSmall *
                    ResponsiveUtil.instance.textScaleFactor(context),
                color: AppColors.greyColor,
              ),
              Text(
                "09:00 PM",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.greyColor),
                textScaler: textScale(context),
              ),
            ],
          ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: GeneralSize.borderRadius2,
                            side: BorderSide(
                              color: AppColors.greenColor,
                              width: 1
                            )
                          )
                        ),
                        onPressed: () {},
                        child: Text(
                          accept,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.greenColor),
                          textScaler: textScale(context),
                        )),
                  ),
                  SizedBox(
                    width: ResponsiveUtil.width(10, context),
                  ),
                  Expanded(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: GeneralSize.borderRadius2,
                            side: BorderSide(
                              color: AppColors.redColor,
                              width: 1
                            )
                          )
                        ),
                        onPressed: () {},
                        child: Text(
                          accept,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.redColor),
                          textScaler: textScale(context),
                        )),
                  )
                ],
              ),
            ],
          ));
  }
}
