import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/pages/customer/category_deatails/category_details_controller.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class CategoryDetailsPage extends StatelessWidget {
  CategoryDetailsPage({super.key});
  CategoryDetailsController controller = Get.put(CategoryDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          key: key,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  //header
                  header(context),
                  //item list
                  controller.categoryResponse.isNotEmpty
                      ? itemList(context)
                      : noDataFound(context)
                ],
              ),
            );
          })),
    );
  }

  Widget header(BuildContext context) {
    final index = controller.homeController.currentSelectedIndex;
    return customContainer(
        width: double.infinity,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
        isGradient: true,
        child: controller.categoryResponse.isEmpty
            ? noDataFound(context)
            : Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: backButton(context),
                  ),
                  CircleAvatar(
                    radius:
                        40 * ResponsiveUtil.instance.textScaleFactor(context),
                    backgroundColor: AppColors.whiteColor,
                    child: FittedBox(
                        child: CircleAvatar(
                      radius:
                          38 * ResponsiveUtil.instance.textScaleFactor(context),
                      backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage(
                        controller.categoryResponse[index].image.toString(),
                      ),
                    )),
                  ),
                  Text(
                    controller.categoryResponse[index].name!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.secondaryColor),
                    textScaler: textScale(context),
                  ),
                  SizedBox(
                    height: ResponsiveUtil.height(5, context),
                  ),
                  // Text(
                  //   "${controller.categoryResponse.length} Experts",
                  //   style: Theme.of(context).textTheme.displaySmall,
                  //   textScaler: textScale(context),
                  // )
                ],
              ));
  }

  Widget itemList(BuildContext context) {
    return Padding(
      padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
      child: Expanded(
        child: ListView.builder(
          itemCount: controller.serviceProviders.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return itemCard(context, index);
          },
        ),
      ),
    );
  }

  Widget itemCard(BuildContext context, int index) {
    final data = controller.serviceProviders[index];
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
                  backgroundImage: NetworkImage(data.image.toString()),
                ),
                title: Text(
                  data.name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),
                subtitle: Text(
                  data.service.toString(),
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
                            data.averageRating.toString(),
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
                        "Rs ${data.charge!.amount}/${data.charge!.per}",
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
                      onPressed: () {
                        controller.bookButtonClicked(index);
                      },
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
