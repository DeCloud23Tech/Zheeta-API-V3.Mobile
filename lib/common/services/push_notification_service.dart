import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await PushNotificationService.instance.setupFlutterNotifications();
  await PushNotificationService.instance.showNotification(message);
}

@prod
@singleton
class PushNotificationService {
  PushNotificationService();

  static final PushNotificationService instance = PushNotificationService();

  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request notification permission
    await _requestNotificationPermission();

    // Setup message handlers
    await _setupMessageHandlers();

    // // Get device token
    // await getDeviceToken();
  }

// ishokarobertt+5@gmail.com
  // Get the device token for push notifications
  Future<String?> getDeviceToken() async {
    String? token;
    try {
      if (Platform.isIOS) {
        final apnsToken = await _messaging.getAPNSToken();
        token = apnsToken;
        debugPrint("APNs Token: $apnsToken");
      } else {
        token = await _messaging.getToken();
        debugPrint("FCM Token: $token");
      }

      if (token != null) {
        // You can send the token to your backend server for storing or subscription
        return token;
      }
    } catch (e) {
      debugPrint('Error getting device token: $e');
    }
    return null;
  }

  Future<void> _requestNotificationPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
    );

    debugPrint('Permission status: ${settings.authorizationStatus}');
  }

  Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // Android setup
    const AndroidNotificationChannel instantChannel =
        AndroidNotificationChannel(
      'instant_notification_channel', // ID
      'Instant Notifications', // Name
      description: 'Channel for instant notifications', // Description
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(instantChannel);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS setup
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _onNotificationTap,
    );

    _isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'instant_notification_channel', // Use the created channel ID
            'Instant Notifications',
            channelDescription: 'Channel for instant notifications',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker',
            icon: '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  Future<void> _setupMessageHandlers() async {
    // Foreground handler
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('Foreground message: ${message.data}');
      showNotification(message);
    });

    // Background handler
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Opened app from terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    debugPrint('Background message: ${message.data}');
    if (message.data['type'] == 'reminder') {
      // Open reminder screen
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    debugPrint('Notification tapped: ${response.payload}');
    // Handle notification tap (e.g., navigate to a specific screen)
    if (response.payload != null) {
      final payload = response.payload!;
      // Parse payload and navigate accordingly
    }
  }
}
