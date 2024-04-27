import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void checkPermission() async {
    await messaging.requestPermission();
  }

  void init() async {
    checkPermission();
    String? token = await messaging.getToken();
    print("token : $token");
    AwesomeNotifications().initialize(
      '',
      [
        NotificationChannel(
          channelKey: 'service_plus',
          channelName: 'Service Plus Notify',
          channelDescription: 'Notification channel for basic notifications',
        )
      ],
    );
    FirebaseMessaging.onMessage.listen((event) {
      handleMessage(event);
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      handleMessage(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(event);
    });
  }

  handleMessage(RemoteMessage msg) {
    if (msg.notification != null) {
      String? title = msg.notification!.title;
      String? body = msg.notification!.body;
      showNotification(title, body);
    }
  }

  showNotification(title, body) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'service_plus',
        title: title,
        body: body,
      ),
    );
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    Get.offAndToNamed(AppRoutes.providerNotification);
  }
}
