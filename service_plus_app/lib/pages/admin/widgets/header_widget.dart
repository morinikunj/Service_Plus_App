import 'package:flutter/material.dart';
import 'package:service_plus_app/components/custom_popmenu.dart';

import '../../../utils/constants/app_colors.dart';

Widget headerWidget(String title, BuildContext context) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColors.secondaryColor,
            ),
      ),
      const Spacer(),
      customPopupMenu(
        context: context,
        items: [
          const PopupMenuItem(child: Text("change Password")),
          const PopupMenuItem(child: Text("Logout"))
        ],
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.amber,
        ),
      )
    ],
  );
}
