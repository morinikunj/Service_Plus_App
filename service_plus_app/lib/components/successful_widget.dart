import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class SuccessfulWidget extends StatelessWidget {
  SuccessfulWidget({super.key, required this.desc, required this.onPress});

  String desc;
  VoidCallback onPress;
  ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 5));

  @override
  Widget build(BuildContext context) {
    confettiController.play();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: ResponsiveUtil.width(24, context),
                  top: ResponsiveUtil.height(120, context),
                  right: ResponsiveUtil.width(24, context)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AppImage.successTick,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 3.5),
                  SizedBox(
                    height: ResponsiveUtil.height(20, context),
                  ),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    textScaler: textScale(context),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ResponsiveUtil.height(40, context),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: onPress,
                        child: Text(
                          gotoBooking.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: AppColors.whiteColor),
                          textScaler: textScale(context),
                        )),
                  )
                ],
              ),
            ),
            ConfettiWidget(
              shouldLoop: true,
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              minimumSize: const Size(15, 7),
              maximumSize: const Size(20, 7),
              numberOfParticles: 15,
              gravity: 0.1,
              minBlastForce: 10,
            ),
          ],
        ),
      ),
    );
  }
}
