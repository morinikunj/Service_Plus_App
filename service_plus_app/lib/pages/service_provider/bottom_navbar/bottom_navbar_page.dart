import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/bottom_navbar/bottom_navbar_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProviderBottomNavbarPage extends StatelessWidget {
  const ProviderBottomNavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavbarController(),
      id: "navbar",
      builder: (controller) => Scaffold(
        body: controller.pages[controller.currentPage],
        bottomSheet: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: NavigationBar(
              height: ResponsiveUtil.height(60, context),
              backgroundColor: AppColors.secondaryColor,
              shadowColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              selectedIndex: controller.currentPage,
              onDestinationSelected: controller.onPageSelected,
              destinations: List.generate(controller.data.length, (index) {
                return NavigationDestination(
                    icon: Icon(
                      controller.data[index],
                      color: controller.currentPage == index
                          ? AppColors.yellowColor
                          : AppColors.greyColor,
                      size: GeneralSize.iconMedium *
                          ResponsiveUtil.instance.textScaleFactor(context),
                    ),
                    label: "");
              })),
        ),
      ),
    );
  }
}
