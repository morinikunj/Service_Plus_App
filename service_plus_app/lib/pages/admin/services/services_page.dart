import 'package:flutter/material.dart';
import 'package:service_plus_app/components/custom_container.dart';
import 'package:service_plus_app/pages/admin/widgets/header_widget.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: customContainer(
            width: double.infinity,
            color: AppColors.whiteColor,
            child:  headerWidget(serviceManagement, context)
          )
        )
      ],
    );
  }
}