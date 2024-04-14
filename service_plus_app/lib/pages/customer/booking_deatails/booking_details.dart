import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
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
        ));
  }

  Widget bookingCard() {
    return Card(
      child: Column(
        children: [
          ListTile(
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
                  .displaySmall!
                  .copyWith(color: AppColors.greyColor),
              textScaler: textScale(context),
            ),
            trailing: customContainer(
                color: AppColors.accentColor,
                padding: commonSysmPadding(context, horizontal: 5, vertical: 5),
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
              const Spacer(),
              Text(
                "Rs 200",
                style: Theme.of(context).textTheme.labelSmall,
                textScaler: textScale(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
