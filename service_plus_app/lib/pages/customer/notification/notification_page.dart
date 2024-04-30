import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(context),
            Expanded(
              child: Padding(
                padding:
                    commonSysmPadding(context, horizontal: 15, vertical: 10),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return notifyCard(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notifications,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            Text(
              clear,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.primaryColor),
              textScaler: textScale(context),
            )
          ],
        ));
  }

  Widget notifyCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: customContainer(
                color: AppColors.yellowColor,
                padding: EdgeInsets.all(
                    5 * ResponsiveUtil.instance.textScaleFactor(context)),
                borderRadius: 100,
                child: Icon(
                  AppIcons.notifyIcon,
                  color: AppColors.whiteColor,
                  size: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                )),
            title: Text(
              desc,
              style: Theme.of(context).textTheme.displaySmall,
              textScaler: textScale(context),
              softWrap: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: ResponsiveUtil.width(20, context),
                bottom: ResponsiveUtil.height(10, context)),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "09:00 PM",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.greyColor),
                textScaler: textScale(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

String desc =
    "Your booking has been successfully uccessfully successfully uccessfully.";
