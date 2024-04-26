import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details_controller.dart';
import 'package:service_plus_app/pages/service_provider/bookings/booking_details_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProviderBookingsPage extends StatelessWidget {
  const ProviderBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "bookings",
      init: ProviderBookingController(),
      builder: (controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                header(context),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        color: AppColors.redColor,
                      ),
                      Container(
                        color: AppColors.greenColor,
                      ),
                      Container(
                        color: AppColors.secondaryColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        padding: EdgeInsets.zero,
        isGradient: true,
        child: Column(
          children: [
            Padding(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    myBooking,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.secondaryColor),
                  )
                ],
              ),
            ),
            TabBar(indicatorColor: AppColors.yellowColor, tabs: [
              Text(
                upcoming,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              ),
              Text(
                completed,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              ),
              Text(
                cancelled,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              )
            ])
          ],
        ));
  }

  Widget bookingCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 18, vertical: 15),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.yellowColor,
                radius: GeneralSize.iconSize *
                    ResponsiveUtil.instance.textScaleFactor(context),
              ),
              title: Text(
                "Robin Hood",
                style: Theme.of(context).textTheme.titleMedium,
                textScaler: textScale(context),
              ),
              subtitle: Text(
                "Cleaning",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.greyColor),
                textScaler: textScale(context),
              ),
              trailing: customContainer(
                  color: AppColors.greyColor1,
                  borderRadius: 15,
                  padding:
                      commonSysmPadding(context, horizontal: 8, vertical: 5),
                  child: Text(
                    "Running",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: AppColors.redColor),
                  )),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.bookingIcon,
                  size: 16 * ResponsiveUtil.instance.textScaleFactor(context),
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
                  size: 16 * ResponsiveUtil.instance.textScaleFactor(context),
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
                const Spacer(),
                Text(
                  "Rs 200/hr",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
