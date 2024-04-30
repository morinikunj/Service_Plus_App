import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/bindings/general_bindings.dart';
import 'package:service_plus_app/services/notification_services.dart';
import 'package:service_plus_app/theme/app_theme.dart';
import 'package:service_plus_app/utils/responsive_util/responsive_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUtil.instance.init(context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialBinding: GeneralBinding(),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.providerSplashScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
