
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("User", style: Theme.of(context).textTheme.labelSmall, textScaler: textScale(context),)),
            SizedBox(
              height: 30,
            ),
             ElevatedButton(onPressed: (){}, child: Text("Service Provider", style: Theme.of(context).textTheme.labelSmall, textScaler: textScale(context),))
          ],
        ),
      ),
    );
  }
}