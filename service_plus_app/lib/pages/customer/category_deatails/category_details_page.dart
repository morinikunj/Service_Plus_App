import 'package:flutter/material.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_button.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                header(context),
                //item list
                itemList(context)
              ],
            ),
          )),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        width: double.infinity,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        isGradient: true,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: backButton(context),
            ),
            CircleAvatar(
              radius: 40 * ResponsiveUtil.instance.textScaleFactor(context),
              backgroundColor: AppColors.whiteColor,
              child: FittedBox(
                  child: CircleAvatar(
                radius: 36 * ResponsiveUtil.instance.textScaleFactor(context),
                backgroundColor: Colors.amber,
              )),
            ),
            Text(
              "Gardening",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            SizedBox(
              height: ResponsiveUtil.height(5, context),
            ),
            Text(
              "15 Experts",
              style: Theme.of(context).textTheme.displaySmall,
              textScaler: textScale(context),
            )
          ],
        ));
  }

  Widget itemList(BuildContext context) {
    return Padding(
      padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
      child: Expanded(
        child: ListView.builder(
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return itemCard(context);
          },
        ),
      ),
    );
  }

  Widget itemCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ResponsiveUtil.height(10, context)),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30 * ResponsiveUtil.instance.textScaleFactor(context),
                  backgroundColor: Colors.amber,
                ),
                title: Text(
                  "Robin Hood",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  "Garderning",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        rating,
                        style: Theme.of(context).textTheme.displaySmall,
                        textScaler: textScale(context),
                      ),
                      Row(
                        children: [
                          Icon(
                            AppIcons.ratingIcon,
                            color: AppColors.yellowColor,
                            size: 15 *
                                ResponsiveUtil.instance
                                    .textScaleFactor(context),
                          ),
                          Text(
                            "5.0",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: AppColors.secondaryColor),
                            textScaler: textScale(context),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        charge,
                        style: Theme.of(context).textTheme.displaySmall,
                        textScaler: textScale(context),
                      ),
                      Text(
                        "Rs 200/day",
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: AppColors.secondaryColor),
                        textScaler: textScale(context),
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.yellowColor)),
                      onPressed: () {},
                      child: Text(
                        book,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.whiteColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
