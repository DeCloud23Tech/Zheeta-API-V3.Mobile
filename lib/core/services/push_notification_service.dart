import 'dart:io';
import 'dart:convert'; // For jsonDecode
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'package:zheeta/di/di.dart';
// import 'package:zheeta/router/app_router.dart'; // Import your router if needed for navigation

// ============================================================================
// TOP-LEVEL FUNCTIONS (MUST BE STATIC OR TOP-LEVEL FOR PLATFORM CALLBACKS)
// ============================================================================

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling FCM background message: ${message.messageId}');
  // Ensure Firebase is initialized in this background isolate
  await Firebase.initializeApp();

  // Configure GetIt for this isolate. Essential for accessing singletons.
  configureDependencies(Environment.prod);

  final pushNotificationService = locator<PushNotificationService>();

  // Only show local notification if there's an actual notification payload
  if (message.notification != null) {
    // Ensure local notifications are set up in this isolate
    await pushNotificationService.initializeLocalNotifications();
    await pushNotificationService.showNotification(message);
  }

  // Handle data-only messages differently if needed
  if (message.data.isNotEmpty) {
    debugPrint('FCM background data: ${message.data}');
    // Process data, e.g., update local database, fetch new content etc.
    if (message.data['type'] == 'reminder') {
      // Do reminder-specific background processing
    }
  }
}

@pragma('vm:entry-point')
void localNotificationTapBackgroundHandler(
    NotificationResponse notificationResponse) {
  debugPrint(
      'Local notification tapped (top-level background handler): ${notificationResponse.payload}');

  // Configure GetIt for this isolate. Essential for accessing singletons.
  configureDependencies(Environment.prod);

  final pushNotificationService = locator<PushNotificationService>();
  pushNotificationService.handleLocalNotificationTap(notificationResponse);
}

// ============================================================================
// SERVICE CLASS
// ============================================================================

class PushNotificationService {
  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _isFlutterLocalNotificationsInitialized = false;

  PushNotificationService();

  Future<void> initialize() async {
    // Register the background message handler.
    // This should ideally be called once in your main() function before runApp().
    // Calling it here is harmless if it's also in main(), but main() is preferred.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Initialize local notifications for foreground and tap handling
    await initializeLocalNotifications();

    // Request notification permission from the user
    await _requestNotificationPermission();

    // Set up Firebase Messaging handlers for foreground and app-opened scenarios
    _setupForegroundMessageHandlers();

    // Optionally get device token here if needed on app startup
    // await getDeviceToken();
  }

  // Unified method to initialize Flutter Local Notifications
  Future<void> initializeLocalNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }

    // Android channel creation
    const AndroidNotificationChannel instantChannel =
        AndroidNotificationChannel(
      'instant_notification_channel',
      'Instant Notifications',
      description: 'Channel for instant notifications',
      importance: Importance.high,
    );
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(instantChannel);

    // Android initialization settings
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS initialization settings
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // General initialization settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotifications.initialize(
      initializationSettings,
      // Use the top-level handler for all tap responses
      onDidReceiveNotificationResponse: localNotificationTapBackgroundHandler,
      onDidReceiveBackgroundNotificationResponse:
          localNotificationTapBackgroundHandler,
    );

    _isFlutterLocalNotificationsInitialized = true;
    debugPrint('Flutter Local Notifications initialized.');
  }

  // Password@23
  // Seeduser1@gmail.com
  Future<String?> getDeviceToken() async {
    String? token;
    try {
      if (Platform.isIOS) {
        final token = await _messaging.getAPNSToken();
        debugPrint("APNs Token: $token");
      } else {
        token = await _messaging.getToken();
        debugPrint("FCM Token: $token");
      }
      return token;
    } catch (e, stackTrace) {
      debugPrint('Error getting device token: $e\n$stackTrace');
      return null;
    }
  }

  Future<void> _requestNotificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      announcement: false,
      carPlay: false,
      criticalAlert: false,
    );
    debugPrint(
        'Notification permission status: ${settings.authorizationStatus}');
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (!_isFlutterLocalNotificationsInitialized) {
      await initializeLocalNotifications(); // Ensure initialized if called independently
    }

    if (notification != null && (android != null || Platform.isIOS)) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'instant_notification_channel',
            'Instant Notifications',
            channelDescription: 'Channel for instant notifications',
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'ticker',
            icon: android?.smallIcon ?? '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true),
        ),
        payload: message.data.toString(),
      );
      debugPrint(
          'Local notification shown for message ID: ${message.messageId}');
    } else {
      debugPrint(
          'Notification or platform details missing for message ID: ${message.messageId}');
    }
  }

  void _setupForegroundMessageHandlers() {
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('FCM Foreground message: ${message.data}');
      if (message.notification != null) {
        showNotification(message);
      } else {
        _handleDataMessage(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('FCM OnMessageOpenedApp: ${message.data}');
      _handleNotificationClick(message);
    });

    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        debugPrint('FCM GetInitialMessage (app terminated): ${message.data}');
        _handleNotificationClick(message);
      }
    });
  }

  void _handleNotificationClick(RemoteMessage message) {
    debugPrint('Notification clicked with data: ${message.data}');
    // Logic for navigating based on FCM notification click
    // Example: router.push(SomeRoute(data: message.data));
  }

  void _handleDataMessage(RemoteMessage message) {
    debugPrint('FCM data message received in foreground: ${message.data}');
    // Process data, e.g., update UI, refresh data etc.
  }

  // Public method to be called by the top-level localNotificationTapBackgroundHandler
  void handleLocalNotificationTap(NotificationResponse response) {
    debugPrint('Notification tapped (service logic): ${response.payload}');
    if (response.payload != null && response.payload!.isNotEmpty) {
      try {
        final Map<String, dynamic> data = jsonDecode(response.payload!);
        debugPrint('Parsed notification payload: $data');
        // Implement navigation or other actions here
        // Example:
        // final router = locator<AppRouter>();
        // if (data['type'] == 'chat' && data['chatId'] != null) {
        //   router.push(ChatRoute(chatId: data['chatId']));
        // } else if (data['type'] == 'profile' && data['userId'] != null) {
        //   router.push(ProfileRoute(userId: data['userId']));
        // }
      } catch (e, stackTrace) {
        debugPrint(
            'Error parsing local notification payload or handling tap: $e\n$stackTrace');
      }
    }
  }

  void dispose() {
    debugPrint('PushNotificationService dispose called.');
  }
}
