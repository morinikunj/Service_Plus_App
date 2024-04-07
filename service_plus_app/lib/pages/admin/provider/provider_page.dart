import 'package:flutter/material.dart';
import 'package:service_plus_app/pages/admin/user/users_page.dart';
import 'package:service_plus_app/pages/admin/widgets/header_widget.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

import '../../../components/custom_container.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: customContainer(
            width: double.infinity,
            color: AppColors.whiteColor,
            child:  headerWidget(providerManagement, context)
          )
        ),
         const SizedBox(
          height: 20,
        ),
        Expanded(
          child: customTableWidget(context),
        )
      ],
    );
  }
}