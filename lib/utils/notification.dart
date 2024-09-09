import 'dart:async';
import 'dart:io';
import 'package:bakery_app/utils/secure_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


class FlutterLocalNotification {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // static final StreamController<String> notificationStream = StreamController.broadcast();

  // 푸시알림을 탭했을 때 호출되는 콜백 함수
  // static void onNotificationTap(NotificationResponse notificationResponse){
  //   notificationStream.add(notificationResponse.payload!);
  // }

  static init() async {
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    requestAndroidNotificationPermission();

    AndroidInitializationSettings androidInitializationSettings = const AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );

    // initial setting, Android Foreground Handling
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      // onDidReceiveBackgroundNotificationResponse: onNotificationTap,
    );

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: true,
      sound: false,
    );

    // Android & iOS Foreground (앱이 실행된 경우에 알림을 받는 경우)
    foregroundNotification();

    // Android Background & Android Terminated & IOS Terminated
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      handleMessage(message);
    }

    // IOS Background, IOS Foreground Handling
    if (Platform.isIOS){
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
        handleMessage(message);
      });
    }
  }

  static void handleMessage(RemoteMessage message) async {
    print(message.data);
    final url = message.data['url'];
    String? isLogin = await SecureStorage.get(Cached.ACCESS);
    if (isLogin != null) {
      Get.offAllNamed('/login');
      return;
    } else
    if (url != null) {
      Get.toNamed('/${message.data['url']}/${message.data['targetId']}');
      return;
    }
  }
  
  static requestAndroidNotificationPermission() async {
    if(Platform.isAndroid) {
      // Android Notification Channel을 디바이스에 생성
      await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(const AndroidNotificationChannel(
          'high_importance_channel', 'high_importance_notification',
          importance: Importance.max));

      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
      alert: true,
      badge: true,
      sound: true
    );
    }
  }
  
  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'high_importance_channel', 'high_importance_notification',
        channelDescription: 'channelDescription',
        importance: Importance.max,
        priority: Priority.max,
        showWhen: false
    );
    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(badgeNumber: 1));

    // await flutterLocalNotificationsPlugin.show(
    //     0, 'test title', 'test body', notificationDetails,
    //     payload: "HELLOWORLD");
  }

  //! Foreground 상태(앱이 열린 상태에서 받은 경우)
  static void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    //! Payload(전송 데이터)를 Stream에 추가합니다.

    final String payload = notificationResponse.payload ?? "";
    if (notificationResponse.payload != null || notificationResponse.payload!.isNotEmpty) {
      print('FOREGROUND PAYLOAD: $payload');
      // notificationStream.add(payload);
    }
  }

  //! Background 상태(앱이 닫힌 상태에서 받은 경우)
  static void onBackgroundNotificationResponse() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    //! 앱이 Notification을 통해서 열린 경우라면 Payload(전송 데이터)를 Stream에 추가합니다.
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      String payload = notificationAppLaunchDetails!.notificationResponse?.payload ?? "";

      print("BACKGROUND PAYLOAD: $payload");
      // notificationStream.add(payload);
    }
  }

  static void foregroundNotification() {
    var messageString = "";
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      print(notification);

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
                // badgeNumber: 1
              )),
        );
        // setState(() {
        messageString = message.notification!.body!;
        // print("Foreground 메시지 수신: ${message.data}");
        // });
      }
    });
  }
}