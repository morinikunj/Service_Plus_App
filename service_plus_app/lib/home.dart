import 'package:flutter/material.dart';
import 'package:service_plus_app/components/common_gradient.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(children: [
         Container(
          height: ResponsiveUtil.instance.height(200, context),
        //  width: ResponsiveUtil.width(200),
        width: double.infinity,
          color: Colors.amber,
        child: Text("Hello", style: Theme.of(context).textTheme.displaySmall, textScaler: textScale(context),),
        ),
        Container(
          height: ResponsiveUtil.instance.height(200, context),
        //  width: ResponsiveUtil.width(300),
          decoration: BoxDecoration(gradient: customGradient),
        )
      ]),
    );
  }
}
