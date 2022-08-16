import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../app/app.dart';
import 'generate_screen.dart';

class NotificationInitializer {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();


  static void showNotification(RemoteMessage message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      Platform.isAndroid ? 'coronatrace-android' : 'coronatrace-ios',
      'coronatrace',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
      );
    }
  }

  static void initializeNotification() async {
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (_) async {
        await Navigator.of(App.navigatorKey.currentState!.context).push(
          GenerateScreen.onGenerate(
            const RouteSettings(
              name: NameScreen.splashScreen,
            ),
          ),
        );
      },
    );
    final messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      showNotification(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) async {
        print('Message Opened App');
      },
    );
    messaging.subscribeToTopic('chef');
  }


}