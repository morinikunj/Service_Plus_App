import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/booking/booking_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "booking",
      init: BookingController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: commonSysmPadding(context, horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectDate,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(10, context),
                ),
                DatePicker(
                  height: ResponsiveUtil.height(100, context),
                  width: ResponsiveUtil.width(60, context),
                  controller.startDate,
                  initialSelectedDate: controller.startDate,
                  selectionColor: AppColors.secondaryColor,
                  selectedTextColor: AppColors.whiteColor,
                  onDateChange: (selectedDate) {
                    controller.selectDate(selectedDate);
                  },
                ),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                Text(
                  avilableTimings,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(10, context),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(40, context),
                  child: ListView.builder(
                    itemCount: controller.times.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.selectTime(index);
                        },
                        child: customContainer(
                          margin: EdgeInsets.only(
                              right: ResponsiveUtil.width(10, context)),
                          padding: commonSysmPadding(context,
                              horizontal: 20, vertical: 10),
                          borderRadius: 10,
                          color: controller.currentSlot == index
                              ? AppColors.secondaryColor
                              : AppColors.whiteColor,
                          child: Text(
                            controller.times[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: controller.currentSlot == index
                                        ? AppColors.whiteColor
                                        : AppColors.secondaryColor),
                            textScaler: textScale(context),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                Text(
                  selectAddress,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                Row(
                  children: [
                    Icon(
                      AppIcons.locationIcon,
                      color: AppColors.redColor,
                      size: GeneralSize.iconMedium *
                          ResponsiveUtil.instance.textScaleFactor(context),
                    ),
                    SizedBox(
                      width: ResponsiveUtil.width(10, context),
                    ),
                    DropdownButton(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        value: 1,
                        items: [
                          DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Select Address",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 2,
                            child: Text("data"),
                          ),
                          const DropdownMenuItem(
                            value: 3,
                            child: Text("data"),
                          )
                        ],
                        onChanged: (val) {})
                  ],
                ),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.confirm,
                    child: Text(
                      confirm.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.whiteColor),
                      textScaler: textScale(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
