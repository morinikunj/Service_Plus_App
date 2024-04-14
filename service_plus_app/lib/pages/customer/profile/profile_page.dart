import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        isGradient: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            ListTile(
              leading: customContainer(
                  padding: EdgeInsets.all(
                      1 * ResponsiveUtil.instance.textScaleFactor(context)),
                  borderRadius: 100,
                  child: CircleAvatar(
                    radius:
                        40 * ResponsiveUtil.instance.textScaleFactor(context),
                    backgroundColor: AppColors.yellowColor,
                  )),
              title: Text(
                "Robin Hood",
                style: Theme.of(context).textTheme.titleMedium,
                textScaler: textScale(context),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    AppIcons.emailIcon,
                    size: GeneralSize.iconSmall *
                        ResponsiveUtil.instance.textScaleFactor(context),
                  ),
                  Text(
                    "abc123@gmail.com",
                    style: Theme.of(context).textTheme.displaySmall,
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
    return Card(
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
              .copyWith(color: AppColors.greyColor),
          textScaler: textScale(context),
        ),
        trailing: Icon(
          AppIcons.rightArraw,
          size: GeneralSize.iconSize *
              ResponsiveUtil.instance.textScaleFactor(context),
          color: AppColors.greyColor,
        ),
      ),
    );
  }

  Widget customSpacer() {
    return SizedBox(
      height: ResponsiveUtil.height(15, context),
    );
  }

  Widget logoutButton(BuildContext context) {
    return customElevatedButton(context,
        child: Text(
          logout,
          style: Theme.of(context).textTheme.titleSmall,
          textScaler: textScale(context),
        ),
        buttonStyle: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(AppColors.redColor)));
  }
}
