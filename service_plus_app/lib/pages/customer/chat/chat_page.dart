import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/chat/chat_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
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
    return GetBuilder(
      id: "chat",
      init: ChatController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(context),
              Expanded(
                child: Padding(
                  padding:
                      commonSysmPadding(context, horizontal: 15, vertical: 10),
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return personCard(context);
                    },
                  ),
                ),
              )
            ],
          ),
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
              messages,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     AppIcons.searchIcon,
            //     size: GeneralSize.iconBig *
            //         ResponsiveUtil.instance.textScaleFactor(context),
            //   ),
            // )
          ],
        ));
  }

  Widget personCard(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.chatDetails);
        },
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
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.greyColor),
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
            CircleAvatar(
                radius: 10 * ResponsiveUtil.instance.textScaleFactor(context),
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      "2",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.whiteColor),
                      textScaler: textScale(context),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
