import 'package:flutter/material.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class DashBoardapage extends StatelessWidget {
  const DashBoardapage({super.key});

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


  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Home",
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