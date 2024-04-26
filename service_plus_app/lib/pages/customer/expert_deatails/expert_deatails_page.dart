import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/models/response/service_provider_profile.dart';
import 'package:service_plus_app/pages/customer/booking/booking_widget.dart';
import 'package:service_plus_app/pages/customer/expert_deatails/expert_details_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ExpertDetailsPage extends StatelessWidget {
  ExpertDetailsPage({super.key});
  ExpertDetailsController controller = Get.put(ExpertDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.serviceProvider!.name == null) {
          return noDataFound(context);
        }
        return SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            header(context),
            // reviewCard(context),
            Padding(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 10),
              child: Text(
                servicesText,
                style: Theme.of(context).textTheme.titleSmall!,
                textScaler: textScale(context),
              ),
            ),
            customContainer(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 0),
              width: double.infinity,
              height: ResponsiveUtil.height(100, context),
              child: ListView.builder(
                itemCount: controller
                    .homeController.categoryResponse.value.categories!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final data = controller
                      .homeController.categoryResponse.value.categories!;
                  return Card(
                    child: customContainer(
                        padding: EdgeInsets.zero,
                        borderRadius: 20,
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                width: 100,
                                height: 65,
                                data[index].image.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              data[index].name.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 10),
                              textScaler: textScale(context),
                            )
                          ],
                        ),
                        color: Colors.yellow),
                  );
                },
              ),
            ),
            Padding(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 10),
              child: Text(
                topreviwes,
                style: Theme.of(context).textTheme.titleSmall!,
                textScaler: textScale(context),
              ),
            ),
            customContainer(
                height: ResponsiveUtil.height(180, context),
                width: double.infinity,
                padding:
                    commonSysmPadding(context, horizontal: 24, vertical: 10),
                child: controller.serviceProvider!.ratings!.isEmpty
                    ? noDataFound(context)
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.serviceProvider!.ratings!.length,
                        itemBuilder: (context, index) {
                          final data = controller.serviceProvider!.ratings!;
                          return SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  ResponsiveUtil.width(50, context),
                              child: reviewCard(context, data[index]));
                        },
                      )),
            Padding(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 10),
              child: Text(
                workPortfolio,
                style: Theme.of(context).textTheme.titleSmall!,
                textScaler: textScale(context),
              ),
            ),
            Padding(
              padding: commonSysmPadding(context, horizontal: 20, vertical: 0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.greenColor,
                  );
                },
              ),
            )
          ]),
        );
      })),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                backButton(context),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.chatIcon,
                    color: AppColors.whiteColor,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor),
                  iconSize: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                )
              ],
            ),
            customContainer(
              padding: EdgeInsets.zero,
              borderRadius: 100,
              border: Border.all(color: AppColors.whiteColor, width: 3),
              child: CircleAvatar(
                backgroundColor: AppColors.yellowColor,
                radius: 60 * ResponsiveUtil.instance.textScaleFactor(context),
              ),
            ),
            SizedBox(
              height: ResponsiveUtil.height(10, context),
            ),
            Text(
              controller.serviceProvider!.name!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  AppIcons.ratingIcon,
                  color: AppColors.yellowColor,
                  size: GeneralSize.iconSmall *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  controller.serviceProvider!.averageRating!.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  width: ResponsiveUtil.width(10, context),
                ),
                Text(
                  "Rs. ${controller.serviceProvider!.charge!.amount}/${controller.serviceProvider!.charge!.per}",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            SizedBox(
              height: ResponsiveUtil.height(10, context),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.locationIcon,
                  color: AppColors.redColor,
                  size: GeneralSize.iconSize *
                      ResponsiveUtil.instance.textScaleFactor(context),
                ),
                Text(
                  location,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  controller.serviceProvider!.serviceLocation.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                )
              ],
            ),
            // SizedBox(
            //   height: ResponsiveUtil.height(3, context),
            // ),
            // Row(
            //   children: [
            //     Icon(
            //       AppIcons.experienceIcon,
            //       color: AppColors.primaryColor,
            //       size: GeneralSize.iconSize *
            //           ResponsiveUtil.instance.textScaleFactor(context),
            //     ),
            //     Text(
            //       experience,
            //       style: Theme.of(context)
            //           .textTheme
            //           .displaySmall!
            //           .copyWith(color: AppColors.greyColor),
            //       textScaler: textScale(context),
            //     ),
            //     const Spacer(),
            //     Text(
            //       "5 Years",
            //       style: Theme.of(context)
            //           .textTheme
            //           .displaySmall!
            //           .copyWith(color: AppColors.secondaryColor),
            //       textScaler: textScale(context),
            //     )
            //   ],
            // ),
            SizedBox(
              height: ResponsiveUtil.height(10, context),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(const Booking(),
                          backgroundColor: AppColors.whiteColor);
                    },
                    child: Text(
                      book,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.whiteColor),
                      textScaler: textScale(context),
                    ),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColors.yellowColor)),
                  ),
                ),
                SizedBox(
                  width: ResponsiveUtil.width(20, context),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        call,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.whiteColor),
                        textScaler: textScale(context),
                      )),
                )
              ],
            )
          ],
        ));
  }

  Widget reviewCard(BuildContext context, Ratings data) {
    return Card(
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 24, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.yellowColor,
                radius: GeneralSize.iconSize *
                    ResponsiveUtil.instance.textScaleFactor(context),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.userName.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                    textScaler: textScale(context),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        AppIcons.ratingIcon,
                        color: AppColors.yellowColor,
                        size: GeneralSize.iconSmall *
                            ResponsiveUtil.instance.textScaleFactor(context),
                      ),
                      Text(
                        data.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.greyColor),
                        textScaler: textScale(context),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              data.comment.toString(),
              style: Theme.of(context).textTheme.displaySmall,
              textScaler: textScale(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.left,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }

  Widget services(
    BuildContext context,
  ) {
    return Padding(
      padding: commonSysmPadding(context, vertical: 0, horizontal: 24),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
              crossAxisSpacing: ResponsiveUtil.height(20, context),
              mainAxisSpacing: ResponsiveUtil.width(18, context)),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Card(
                  child: Column(
                children: [
                  //add img inside container
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      // child: Image.asset(
                      //   AppImage.demoImg,
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ),
                  Padding(
                    padding:
                        commonSysmPadding(context, vertical: 3, horizontal: 0),
                    child: Text(
                      "Cooking",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                      textScaler: textScale(context),
                    ),
                  ),
                ],
              )),
            );
          }),
    );
  }
}

String desc =
    "The legal status of women in the United States is, in comparison to other countries, equal to that of men.";
