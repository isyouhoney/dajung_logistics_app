import 'dart:async';
import 'dart:io';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


class FlutterLocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static init(firebaseMessagingBackgroundHandler) async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    requestAndroidNotificationPermission();

    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: true,
      sound: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    // initial setting, Android Foreground Handling
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) async {
        print('notificationResponse.payload : ${notificationResponse.payload}');
        String? isLogin = await SecureStorage.get(Cached.ACCESS);
        if (isLogin == null) {
          Get.offAllNamed('/login');
          return;
        } else {
          Get.toNamed('/${notificationResponse.payload}');
          return;
        }
      }
    );

    // Android & iOS Foreground (앱이 실행된 경우에 알림을 받는 경우)
    foregroundNotification();

    // Android Background & Android Terminated & IOS Terminated
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      handleMessage(message);
    }

    // IOS Background, IOS Foreground Handling
    // if (Platform.isIOS){
      setupInteractedMessage();
    // }
  }

  static void handleMessage(RemoteMessage message) async {
    print(message.data);
    final url = message.data['url'];
    String? isLogin = await SecureStorage.get(Cached.ACCESS);
    if (isLogin == null) {
      Get.offAllNamed('/login');
      return;
    } else {
    if (url != null) {
      Get.toNamed('/${message.data['url']}');
      return;
    }
    }
  }
  
  static requestAndroidNotificationPermission() async {
    if(Platform.isAndroid) {
      // Android Notification Channel을 디바이스에 생성
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(
          const AndroidNotificationChannel(
          'high_importance_channel', 'high_importance_notification',
          importance: Importance.max));

      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
      alert: true,
      badge: true,
      sound: true
    );
    }
  }

  static void foregroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel',
                'high_importance_notification',
                importance: Importance.max,
              ),
              iOS: DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
                badgeNumber: 1
              )),
          payload: message.data['url']
        );
      }
    });
  }

  static Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // 종료상태에서 클릭한 푸시 알림 메세지 핸들링
    if (initialMessage != null) handleMessage(initialMessage);

    // 앱이 백그라운드 상태에서 푸시 알림 클릭 하여 열릴 경우 메세지 스트림을 통해 처리
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
  
  // static Future<void> showNotification() async {
  //   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
  //       'high_importance_channel', 'high_importance_notification',
  //       channelDescription: 'channelDescription',
  //       importance: Importance.max,
  //       priority: Priority.max,
  //       showWhen: false
  //   );
  //   const NotificationDetails notificationDetails = NotificationDetails(
  //       android: androidNotificationDetails,
  //       iOS: DarwinNotificationDetails(badgeNumber: 1));
  //
  //   // await flutterLocalNotificationsPlugin.show(
  //   //     0, 'test title', 'test body', notificationDetails,
  //   //     payload: "HELLOWORLD");
  // }
  //
  // //! Foreground 상태(앱이 열린 상태에서 받은 경우)
  static void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String url = notificationResponse.payload ?? "";
      print('FOREGROUND PAYLOAD: $url');
    if (notificationResponse.payload != null || notificationResponse.payload!.isNotEmpty) {
      String? isLogin = await SecureStorage.get(Cached.ACCESS);
      if (isLogin == null) {
        Get.offAllNamed('/login');
        return;
      } else {
        Get.toNamed('/$url');
        return;
            }
    }
  }
  //
  // //! Background 상태(앱이 닫힌 상태에서 받은 경우)
  // static void onBackgroundNotificationResponse(NotificationResponse notificationResponse) async {
  //   final NotificationAppLaunchDetails? notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  //
  //   //! 앱이 Notification을 통해서 열린 경우라면 Payload(전송 데이터)를 Stream에 추가합니다.
  //   if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //     String payload = notificationAppLaunchDetails!.notificationResponse?.payload ?? "";
  //
  //     print("BACKGROUND PAYLOAD: $payload");
  //     // notificationStream.add(payload);
  //   }
  // }


}