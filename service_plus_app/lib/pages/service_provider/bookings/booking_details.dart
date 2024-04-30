import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/error_widget.dart';
import 'package:service_plus_app/components/loading_widget.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/models/response/booking_details_response.dart';
import 'package:service_plus_app/pages/customer/booking_deatails/booking_details_controller.dart';
import 'package:service_plus_app/pages/service_provider/bookings/booking_details_controller.dart';
import 'package:service_plus_app/services/booking_service.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class ProviderBookingsPage extends StatelessWidget {
  const ProviderBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "bookings",
      init: ProviderBookingController(),
      builder: (controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                header(context),
                Expanded(
                  child: FutureBuilder(
                    future: BookingService().getBookingsDetails(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) { print("fhurgh");
                        final data = snapshot.data;
                        print("${data!.length}");
                        final upcoming = data?.where((i) => i.status == "requested" || i.status == "confirmed"|| i.status == "started").toList(); print("${upcoming!.length}");
                        final completed = data?.where((i) => i.status == "completed").toList();
                        final cancelled = data?.where((element) => element.status == "Cancelled").toList();
                        return TabBarView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: ResponsiveUtil.height(20, context), bottom: ResponsiveUtil.height(80, context),right: ResponsiveUtil.width(24, context) ,left: ResponsiveUtil.width(24, context)),
                       child: ListView.builder(
                        itemCount: upcoming!.length,
                        itemBuilder: (context, index) {
                          return bookingCard(context, upcoming[index]);
                        },
                       )
                      ),
                      Container(
                        padding: EdgeInsets.only(top: ResponsiveUtil.height(20, context), bottom: ResponsiveUtil.height(80, context),right: ResponsiveUtil.width(24, context) ,left: ResponsiveUtil.width(24, context)),
                       child: ListView.builder(
                        itemCount: completed!.length,
                        itemBuilder: (context, index) {
                          return bookingCard(context, completed[index]);
                        },
                       )
                      ),
                      Container(
                        padding: EdgeInsets.only(top: ResponsiveUtil.height(20, context), bottom: ResponsiveUtil.height(80, context),right: ResponsiveUtil.width(24, context) ,left: ResponsiveUtil.width(24, context)),
                       child: ListView.builder(
                        itemCount: cancelled!.length,
                        itemBuilder: (context, index) {
                          return bookingCard(context, cancelled[index]);
                        },
                       )
                      ),
                    ],
                  );
                      } else if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidget();
          } else if (snapshot.hasError) {
            return errorWidget(context, snapshot.error);
          }
          return noDataFound(context);
                    },
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        padding: EdgeInsets.zero,
        isGradient: true,
        child: Column(
          children: [
            Padding(
              padding: commonSysmPadding(context, horizontal: 24, vertical: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    myBooking,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.secondaryColor),
                  )
                ],
              ),
            ),
            TabBar(indicatorColor: AppColors.yellowColor, tabs: [
              Text(
                upcoming,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              ),
              Text(
                completed,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              ),
              Text(
                cancelled,
                style: Theme.of(context).textTheme.titleSmall,
                textScaler: textScale(context),
              )
            ])
          ],
        ));
  }

  Widget bookingCard(BuildContext context, BookingDetailsResponse? data) {
    return Card(
      child: Padding(
        padding: commonSysmPadding(context, horizontal: 18, vertical: 15),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                radius: GeneralSize.iconSize *
                    ResponsiveUtil.instance.textScaleFactor(context),
                    backgroundImage: NetworkImage("https://avatars2.githubusercontent.com/u/38502132?v=4?s=100"),
              ),
              title: Text(
                data!.serviceProviderName.toString(),
                style: Theme.of(context).textTheme.titleMedium,
                textScaler: textScale(context),
              ),
              subtitle: Text(
                data.service.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
                textScaler: textScale(context),
              ),
              trailing: customContainer(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: 15,
                  padding:
                      commonSysmPadding(context, horizontal: 8, vertical: 5),
                  child: Text(
                    data.status.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: data.status == "requested" || data.status == "confirmed" ? AppColors.greenColor : AppColors.redColor),
                  )),
            ),
            Row(
              children: [
                Icon(
                  AppIcons.bookingIcon,
                  size: 16 * ResponsiveUtil.instance.textScaleFactor(context),
                  color: AppColors.greyColor,
                ),
                Text(
                  data.bookingDate.toString(),
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
                  data.bookingTime.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                const Spacer(),
                Text(
                  "Rs ${data.charge!.amount}/${data.charge!.per}",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: AppColors.secondaryColor),
                  textScaler: textScale(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
