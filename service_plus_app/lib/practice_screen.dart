import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_plus_app/routes/app_routes.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chat app"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await ZIMKit.instance.connectUser(id: "1", name: "Nikunj");
                  Get.offAndToNamed(AppRoutes.providerChat);
                },
                child: const Text("service provider")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await ZIMKit.instance.connectUser(id: "2", name: "Kanji");
                Get.offAndToNamed(AppRoutes.chat);
              },
              child: const Text("user"),
            )
          ],
        ),
      ),
    );
  }
}
