import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/back_button.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/common_textformfield.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/customer/add_address/add_address_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/image_strings.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

import '../../../utils/constants/app_icons.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "add_address",
      init: AddAdressController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(context),
              Transform.translate(
                offset: Offset(0, ResponsiveUtil.height(-5, context)),
                child: GestureDetector(
                  onTap: () {
                    controller.addNewAddress(addAddress(context));
                  },
                  child: customContainer(
                      borderRadius: 20,
                      color: AppColors.primaryColor,
                      padding: commonSysmPadding(context,
                          horizontal: 24, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            AppIcons.addIcon,
                            size: GeneralSize.iconMedium *
                                ResponsiveUtil.instance
                                    .textScaleFactor(context),
                            color: AppColors.accentColor,
                          ),
                          Text(
                            addNewAddress,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.accentColor),
                            textScaler: textScale(context),
                          ),
                        ],
                      )),
                ),
              ),
              Expanded(
                child: customContainer(
                    borderRadius: 20,
                    // color: AppColors.whiteColor,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return itemCard(context, "Home",
                            "hbee deded hedebd  edheydhe hedbebd dhebde");
                      },
                    )),
              ),
              //)
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: ResponsiveUtil.height(18, context),
            ),
            backButton(context),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ResponsiveUtil.height(20, context),
                    ),
                    Text(
                      manageAddress,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.secondaryColor),
                      textScaler: textScale(context),
                    ),
                    Text(
                      presavedAddrs,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.greyColor),
                      textScaler: textScale(context),
                    )
                  ],
                ),
                SizedBox(
                  height: ResponsiveUtil.height(200, context),
                  width: ResponsiveUtil.width(120, context),
                  child: Image.asset(
                    AppImage.addtrssImg,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget itemCard(BuildContext context, String title, String address) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          AppIcons.locationIcon,
          size: GeneralSize.iconMedium *
              ResponsiveUtil.instance.textScaleFactor(context),
          color: AppColors.primaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
          textScaler: textScale(context),
        ),
        subtitle: Text(
          address,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.greyColor),
          textScaler: textScale(context),
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget addAddress(BuildContext context) {
    return GetBuilder(
      id: "add_adress",
      init: AddAdressController(),
      builder: (controller) {
        return Form(
          key: controller.key,
          child: Padding(
            padding: commonSysmPadding(context, horizontal: 24, vertical: 18),
            child: Column(
              children: [
                Text(
                  addNewAddress,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.greyColor),
                  textScaler: textScale(context),
                ),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                commonTextField(
                    fontSize: GeneralSize.textsize6,
                    controller: controller.titleTC,
                    hintText: title,
                    padding:
                        commonSysmPadding(context, horizontal: 10, vertical: 1),
                    validator: controller.validateTitle),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                commonTextField(
                    controller: controller.addressTC,
                    hintText: address,
                    fontSize: GeneralSize.textsize6,
                    padding:
                        commonSysmPadding(context, horizontal: 10, vertical: 1),
                    validator: controller.validateAddress),
                SizedBox(
                  height: ResponsiveUtil.height(20, context),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: controller.submit,
                      child: Text(
                        submit,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.whiteColor),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
