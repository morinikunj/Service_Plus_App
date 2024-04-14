import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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

  Widget header() {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              messages,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                AppIcons.searchIcon,
                size: GeneralSize.iconSmall *
                    ResponsiveUtil.instance.textScaleFactor(context),
              ),
            )
          ],
        ));
  }

  Widget personCard() {
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
              "Robin Hood",
              style: Theme.of(context).textTheme.titleSmall,
              textScaler: textScale(context),
            ),
            const Spacer(),
            Text(
              "9:00 PM",
              style: Theme.of(context).textTheme.displaySmall,
              textScaler: textScale(context),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(
              "How are you?",
              style: Theme.of(context).textTheme.labelSmall,
              overflow: TextOverflow.ellipsis,
              textScaler: textScale(context),
            ),
            const Spacer(),
            customContainer(
                color: AppColors.primaryColor,
                padding: EdgeInsets.all(
                    1 * ResponsiveUtil.instance.textScaleFactor(context)),
                child: Text(
                  "2",
                  style: Theme.of(context).textTheme.displaySmall,
                  textScaler: textScale(context),
                )),
          ],
        ),
      ),
    );
  }
}
