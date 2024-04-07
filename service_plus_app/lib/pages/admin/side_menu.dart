import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/controllers/admin/sidemenu_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "menu",
      init: SideMenuController(),
      builder: (controller) {
        return Drawer(
          backgroundColor: AppColors.secondaryColor,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //add logo here
              Text(
                "Service Plus",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: AppColors.whiteColor),
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: Divider(
                  thickness: 0.5,
                  color: AppColors.accentColor,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    return drawerItemWidget(() {
                      controller.selectItem(index);
                    }, controller.dataList[index]["icon"],
                        controller.dataList[index]["title"], context,
                        selected:
                            controller.isSelected == index ? true : false);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget drawerItemWidget(
      VoidCallback onPress, IconData icon, String title, BuildContext context,
      {bool? selected}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: ResponsiveUtil.width(3, context)),
      child: ListTile(
        selectedColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: GeneralSize.borderRadius1),
        selected: selected!,
        selectedTileColor: Colors.amber,
        onTap: onPress,
        leading: Icon(
          icon,
          color: AppColors.whiteColor,
          size: GeneralSize.iconSmall *
              ResponsiveUtil.instance.textScaleFactor(context),
        ),
        title: Text(title),
        textColor: AppColors.whiteColor,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: GeneralSize.mediumBoldFont),
      ),
    );
  }
}
