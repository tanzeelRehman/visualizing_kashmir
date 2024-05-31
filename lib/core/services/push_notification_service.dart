import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:visualizing_kashmir/core/constants/app_pages.dart';
import 'package:visualizing_kashmir/core/services/local_notification_service.dart';

class FirebasePushNotificationService {
  static requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted the permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User Granted provisional permission");
    } else {
      print("User denied permission");
    }
  }

  //! 1. This method call when app in terminated state and you get a notification
  //* when you click on notification, App open from terminated state and you can get notification data in this method
  static messageOnTerminatedState() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        print("+++++ App Started running from terminated state +++++");
        if (message != null) {
          print("type is");
          print(message.data['type']);
          if (message.data['type'] != null) {
            if (message.data['type'] == 'history') {
              Get.toNamed(AppPages.todayInHistoryPage);
            }
          }
        }
      },
    );
  }

  static subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic('Kashmir');
  }

  //! 2. This method only call when App in forground
  //* it means app must be opened
  static messageOnForegroundState() {
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        print("+++++ App is running on Foreground +++++");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          //! Localnotification Method Call
          //? A method to show popup notification {{ONLY WORKS WHEN APP IS IN FOREGROUND}}
          LocalNotificationService.createAndDisplayNotification(message);
        }
      },
    );
  }

  //! 3. This method only call when App in background and not terminated(not closed)
  //? A notifiction will apper on device notificaton list and when user click on it this function will execute
  //* App must be running in background // And user has clicked on it
  static messageOnBackgroundState(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print(
            "+++++ App is running on background & User has clicked on the notification +++++");
        print("FirebaseMessaging.onMessageOpenedApp.listen");

        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("type is");
          print(message.data['type']);
          print(message.data['type']);
          if (message.data['type'] != null) {
            if (message.data['type'] == 'history') {
              Get.toNamed(AppPages.todayInHistoryPage);
            }
          }
          //! By default firebase show the pop up notifications when app is in background {{Only when the channel names match everywhere}}
          //* So we dont need to set local notifications here
        }
      },
    );
  }

  //*================================================== OTHER METHODS ================================================================
  //? ================================================================================================================================

  //! 1. Ask permission from user to take device token
  //* Tokens are very importent, Inorder to send a push notification to a specific device we need that device token
  //? Its best practice to save all device token in the database, So we can send notification to that device any time we want

  //! 2. Get the device token
  static Future<void> getToken() async {
    String mytoken;
    mytoken = (await FirebaseMessaging.instance.getToken())!;
    Logger().i(mytoken);
    //return mytoken;
  }

  // initalize local notifications
  // static Future localNotiInit() async {
  //   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings(
  //     '@mipmap/ic_launcher',
  //   );
  //   final DarwinInitializationSettings initializationSettingsDarwin =
  //       DarwinInitializationSettings(
  //     onDidReceiveLocalNotification: (id, title, body, payload) {},
  //   );
  //   const LinuxInitializationSettings initializationSettingsLinux =
  //       LinuxInitializationSettings(defaultActionName: 'Open notification');
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: initializationSettingsAndroid,
  //           iOS: initializationSettingsDarwin,
  //           linux: initializationSettingsLinux);

  //   // request notification permissions for android 13 or above
  //   _flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()!
  //       .requestNotificationsPermission();

  //   _flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onDidReceiveNotificationResponse: onNotificationTap,
  //       onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  // }

  // static void onNotificationTap(NotificationResponse notificationResponse) {}
}
