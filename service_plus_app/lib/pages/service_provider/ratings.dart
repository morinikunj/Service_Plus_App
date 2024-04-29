import 'package:flutter/material.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

import '../../utils/constants/app_icons.dart';

class RatingsPage extends StatelessWidget {
  const RatingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(context)
          ],
        ),
      ),
    );
  }

  Widget reviewCard(BuildContext context, Ratings data) {
    return Card(
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 24, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
               // backgroundColor: AppColors.yellowColor,
                backgroundImage: NetworkImage(data.userImage.toString()),
                radius: GeneralSize.iconSize *
                    ResponsiveUtil.instance.textScaleFactor(context),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.userName.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                    textScaler: textScale(context),
                    maxLines: 2,
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
                        data.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.greyColor),
                        textScaler: textScale(context),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              data.comment.toString(),
              style: Theme.of(context).textTheme.displaySmall,
              textScaler: textScale(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.left,
              softWrap: true,
            )
          ],
        ),
      ),
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
              "Ratings",
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

}