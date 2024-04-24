import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/chat/chat_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: "chat_msg",
        init: ChatController(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child: Column(
                children: [
                  header(context, controller),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: ResponsiveUtil.height(20, context),
                          left: ResponsiveUtil.width(10, context),
                          right: ResponsiveUtil.width(10, context)),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return chatMessage(context, isSend: true);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveUtil.height(50, context),
                  )
                ],
              ),
            ),
            bottomSheet: customContainer(
              color: AppColors.whiteColor,
              padding: commonSysmPadding(context, horizontal: 15, vertical: 0),
              child: commonTextField(
                  controller: controller.msgTC,
                  fill: false,
                  hintText: "Enter something...",
                  hintTextColor: AppColors.secondaryColor.withOpacity(0.8),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.secondaryColor, width: 1),
                      borderRadius: GeneralSize.borderRadius2),
                  suffixIcon: Visibility(
                    visible: controller.isActiveBtn,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.sendIcon,
                          size: GeneralSize.iconBig *
                              ResponsiveUtil.instance.textScaleFactor(context),
                          color: AppColors.primaryColor,
                        )),
                  )),
            ),
          );
        });
  }

  Widget header(BuildContext context, ChatController controller) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 16, vertical: 10),
        child: Row(
          children: [
            IconButton(
                onPressed: controller.back,
                icon: Icon(
                  AppIcons.backIcon,
                  color: AppColors.secondaryColor,
                  size: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                )),
            CircleAvatar(
              backgroundColor: AppColors.yellowColor,
              radius: GeneralSize.iconSize *
                  ResponsiveUtil.instance.textScaleFactor(context),
            ),
            SizedBox(
              width: ResponsiveUtil.width(10, context),
            ),
            Text(
              "Robin Hood",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  AppIcons.callIcon,
                  color: AppColors.primaryColor,
                  size: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ))
          ],
        ));
  }

  Widget chatMessage(BuildContext context, {bool isSend = false}) {
    if (isSend) {
      return ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: ResponsiveUtil.height(20, context)),
        backGroundColor: AppColors.primaryColor,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.whiteColor),
            textScaler: textScale(context),
          ),
        ),
      );
    } else {
      return ChatBubble(
        clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
        backGroundColor: AppColors.chatBubbleColor,
        margin: EdgeInsets.only(top: ResponsiveUtil.height(20, context)),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
  }
}
