import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_controller.dart';
import 'package:service_plus_app/pages/customer/intro_screen/intro_widget.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "intro_page",
      init: IntroController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                  scrollBehavior: AppScrollBehavior(),
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (BuildContext context, int index) {
                    return IntroWidget(
                      index: index,
                      color: controller.pages[index]['color'],
                      title: controller.pages[index]['title'],
                      description: controller.pages[index]['description'],
                      image: controller.pages[index]['image'],
                      skip: controller.pages[index]['skip'],
                      onTab: controller.onNextPage,
                    );
                  }),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.75,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildIndicator(context))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildIndicator(BuildContext context) {
    final indicators = <Widget>[];

    for (var i = 0; i < controller.pages.length; i++) {
      if (controller.activePage == i) {
        indicators.add(_indicatorsTrue(context));
      } else {
        indicators.add(_indicatorsFalse(context));
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue(BuildContext context) {
    final String color;
    if (controller.activePage == 0) {
      color = '#ffe24e';
    } else if (controller.activePage == 1) {
      color = '#31b77a';
    } else {
      color = '#a3e4f1';
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: ResponsiveUtil.height(6, context),
      width: ResponsiveUtil.width(42, context),
      margin: EdgeInsets.only(right: ResponsiveUtil.width(8, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }

  Widget _indicatorsFalse(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: ResponsiveUtil.height(8, context),
      width: ResponsiveUtil.width(8, context),
      margin: EdgeInsets.only(right: ResponsiveUtil.width(8, context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
