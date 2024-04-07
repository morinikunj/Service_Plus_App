import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/controllers/admin/dashboard_controller.dart';
import 'package:service_plus_app/pages/admin/widgets/header_widget.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 1,
            child: customContainer(
                width: double.infinity,
                color: AppColors.whiteColor,
                child: headerWidget(dashboard, context))),
        GetBuilder(
          id: "dashboard",
          init: DashboardController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(1, context), vertical: ResponsiveUtil.height(30, context)),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: ResponsiveUtil.width(5, context),
                runSpacing: ResponsiveUtil.height(20, context),
                children: List.generate(controller.itemList.length, (index) {
                  return customCard(
                      context,
                      title: controller.itemList[index]["title"],
                      subtitle: controller.itemList[index]["count"],
                      icon: controller.itemList[index]["icon"],
                      color: controller.itemList[index]["color"]
                    );
                })
              ),
            );
          },
        )
      ],
    );
  }

  Widget customCard(BuildContext context,{String title = "", String subtitle = "",IconData? icon ,Color? color}) {
    return customContainer(
       child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: color,
            fontWeight: GeneralSize.mediumBoldFont
          ),
        ),
        subtitle: Text(
          subtitle
        ),
        trailing: Icon(
          icon,
          color: AppColors.greyColor,
        ),

       ),
       // height: 100,
        width: 230,
        color: AppColors.whiteColor,
        borderRadius: 5,
        border: Border(
            left: BorderSide(width: 5, color: color ?? AppColors.whiteColor)));
  }
}
