import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/pages/customer/login/login_page.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.onTab,
    required this.index,
  });

  final String color;
  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: hexToColor(color),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.86,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.16,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0
                        ? const Radius.circular(100)
                        : const Radius.circular(0),
                    topRight: index == 2
                        ? const Radius.circular(100)
                        : const Radius.circular(0),
                  )),
              child: Padding(
                padding:
                    commonSysmPadding(context, horizontal: 45, vertical: 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: ResponsiveUtil.height(62, context),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textScaler: textScale(context),
                    ),
                    SizedBox(
                      height: ResponsiveUtil.height(16, context),
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          height: 1.5 *
                              ResponsiveUtil.instance.textScaleFactor(context),
                          color: AppColors.greyColor),
                      textAlign: TextAlign.center,
                      textScaler: textScale(context),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ResponsiveUtil.height(20, context),
            right: 0,
            left: 0,
            child: Padding(
                padding:
                    commonSysmPadding(context, horizontal: 16, vertical: 16),
                child: skip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              skipNow,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.blackColor),
                              textScaler: textScale(context),
                            ),
                          ),
                          GestureDetector(
                            onTap: onTab,
                            child: Container(
                              padding: commonSysmPadding(context,
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                  color: hexToColor(color),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(AppIcons.arrawRightCircle,
                                  color: AppColors.whiteColor,
                                  size: 42 *
                                      ResponsiveUtil.instance
                                          .textScaleFactor(context)),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: ResponsiveUtil.height(46, context),
                        child: MaterialButton(
                          color: hexToColor(color),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.login);
                          },
                          child: Text(
                            getStarted,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.whiteColor),
                            textScaler: textScale(context),
                          ),
                        ),
                      )),
          )
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
