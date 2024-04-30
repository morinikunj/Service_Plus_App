import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/pages/service_provider/dashboard/dashboard_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class DashBoardapage extends StatelessWidget {
  const DashBoardapage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardProviderController(),
      builder: (controller) {
        return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(context),
            ExpansionTile(
              childrenPadding: commonSysmPadding(context, horizontal: 24, vertical: 10),
              title: Text("Robin hood", style: Theme.of(context).textTheme.titleSmall, textScaler: textScale(context),),
              subtitle:             Row(
              children: [
                Icon(
                  AppIcons.bookingIcon,
                  size: 16 * ResponsiveUtil.instance.textScaleFactor(context),
                  color: AppColors.greyColor,
                ),
                Text(
                  "09/05/2024",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  width: ResponsiveUtil.width(10, context),
                ),
                Icon(
                  AppIcons.clockIcon,
                  size: 16 * ResponsiveUtil.instance.textScaleFactor(context),
                  color: AppColors.greyColor,
                ),
                Text(
                  "09:00 PM",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  "Rs 200/hr",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),
              ],
            ),
            children: [

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStatePropertyAll(AppColors.greenColor)
                    ),
                     child: Text(
                  "Accepted",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),),
                  ),
                  SizedBox(
                    width: ResponsiveUtil.width(30, context),
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom().copyWith(
                      backgroundColor: MaterialStatePropertyAll(AppColors.redColor)
                    ),
                    child: Text(
                  "Rejected",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),),
                  )
                ],
              ),
              Stepper(
                currentStep: controller.currentStep,
                type: StepperType.vertical,
                steps: [
                   Step(
      title: Text('Started', style: Theme.of(context).textTheme.labelSmall, textScaler: textScale(context),),
      content: SizedBox(
        width: double.maxFinite,
        height: 80,
        child: Image.asset(AppImage.startImg),
      ),
      isActive: true,
    ),
    Step(
      title: Text('Completed',  style: Theme.of(context).textTheme.labelSmall, textScaler: textScale(context),),
      content:  Column(
        children: [
          Text("If you want to pay online", style: Theme.of(context).textTheme.displaySmall, textScaler: textScale(context),),
          QrImageView(data: controller.id ?? "", size: ResponsiveUtil.height(120, context),),
        ],
      ),
      isActive: true,
    ),
                ],
                onStepContinue: () {
                  if (controller.currentStep == 0) {
                    controller.currentStep++;
                    controller.update();
                  } else{

                  }
                },
                onStepCancel: null,

              )
            ],
            )
          ],
        ),
      ),
    );
      },
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