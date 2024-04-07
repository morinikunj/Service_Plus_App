import 'package:flutter/material.dart';
import '../../../components/custom_container.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../widgets/header_widget.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: customContainer(
            width: double.infinity,
            color: AppColors.whiteColor,
            child:  headerWidget(bookings, context)
          )
        )
      ],
    );
  }
}
