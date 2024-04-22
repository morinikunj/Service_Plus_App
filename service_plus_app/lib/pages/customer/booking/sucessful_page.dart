import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveUtil.width(24, context),
              top: ResponsiveUtil.height(120, context),
              right: ResponsiveUtil.width(24, context)),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Lottie.asset(AppImage.confetti, repeat: true)),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AppImage.successTick,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 3.5),
                  SizedBox(
                    height: ResponsiveUtil.height(20, context),
                  ),
                  Text(
                    bookingSucessDesc,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    textScaler: textScale(context),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
