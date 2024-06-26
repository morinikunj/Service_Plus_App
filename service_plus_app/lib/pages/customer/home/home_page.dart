import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/components/common_padding.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/components/error_widget.dart';
import 'package:service_plus_app/components/loading_widget.dart';
import 'package:service_plus_app/components/no_data_found_widget.dart';
import 'package:service_plus_app/models/response/category_response.dart';
import 'package:service_plus_app/pages/customer/home/home_controller.dart';
import 'package:service_plus_app/services/user_service.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/app_icons.dart';
import 'package:service_plus_app/utils/constants/general_sizes.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // header
              header(context),
              //search button
              // Transform.translate(
              //   offset: Offset(0, ResponsiveUtil.height(-25, context)),
              //   child: searchButton(context),
              // ),
              SizedBox(
                height: ResponsiveUtil.height(20, context),
              ),
              FutureBuilder(
                future: UserService().getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    CategoryResponse? data = snapshot.data;
                    return services(context, data);
                  }  else if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidget();
          } else if (snapshot.hasError) {
            return errorWidget(context, snapshot.error);
          }
          return noDataFound(context);
                },
              ),
              SizedBox(
                height: ResponsiveUtil.height(70, context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return customContainer(
        isGradient: true,
        padding: commonSysmPadding(context, horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: UserService().getUserProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return CircleAvatar(
                     backgroundImage: NetworkImage(snapshot.data!.profileImg.toString()),
                    backgroundColor: AppColors.primaryColor,
                    radius: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context)
                    // ResponsiveUtil.height(GeneralSize.iconSize, context)
                    );
                    } 
                    return CircleAvatar(
                    //  backgroundImage: AssetImage(AppImage.demoImg),
                    backgroundColor: AppColors.primaryColor,
                    radius: GeneralSize.iconSize *
                        ResponsiveUtil.instance.textScaleFactor(context)
                    // ResponsiveUtil.height(GeneralSize.iconSize, context)
                    );
                  },
                ),
                const Spacer(),
                Icon(
                    AppIcons.locationIcon,
                    size: GeneralSize.iconMedium *
                        ResponsiveUtil.instance.textScaleFactor(context),
                    // size: ResponsiveUtil.height(GeneralSize.iconSize, context),
                    color: AppColors.redColor,
                                   ),
              ],
            ),
            SizedBox(
              height: ResponsiveUtil.height(80, context),
            ),
            Text(
              chooseService,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.secondaryColor),
              textScaler: textScale(context),
              softWrap: true,
            ),
            SizedBox(
              height: ResponsiveUtil.height(40, context),
            )
          ],
        ));
  }

  Widget searchButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: ResponsiveUtil.width(24, context)),
      child: FractionallySizedBox(
        widthFactor: 0.48,
        child: ElevatedButton(
          onPressed: () {},
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              foregroundColor: MaterialStatePropertyAll(AppColors.whiteColor),
              backgroundColor: MaterialStatePropertyAll(AppColors.yellowColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                AppIcons.searchIcon,
                size: ResponsiveUtil.height(25, context),
              ),
              Text(
                search.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.whiteColor),
                textScaler: textScale(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget services(BuildContext context, CategoryResponse? categoryResponse) {
    return Padding(
      padding: commonSysmPadding(context, vertical: 0, horizontal: 24),
      child: GridView.builder(
          itemCount: categoryResponse!.categories!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: ResponsiveUtil.height(20, context),
              mainAxisSpacing: ResponsiveUtil.width(18, context)),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.selectCategory(index,);
              },
              child: Card(
                  child: Column(
                children: [
                  //add img inside container
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(categoryResponse.categories![index].image.toString(),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        commonSysmPadding(context, vertical: 3, horizontal: 0),
                    child: Text(
                           categoryResponse.categories![index].name.toString(),
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
