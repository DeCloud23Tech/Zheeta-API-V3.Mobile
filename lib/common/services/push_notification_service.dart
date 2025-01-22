import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@prod
@LazySingleton()
class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  String? _deviceToken;

  Future<void> initialize() async {
    // Firebase message handling
    FirebaseMessaging.onMessage.listen(_firebaseMessageHandler);

    // Platform-specific initialization
    const androidInitializationSettings = AndroidInitializationSettings('app_icon');
    final darwinInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // Request permissions for push notifications
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission();
    }

    if (Platform.isAndroid) {
      await _createNotificationChannel();
    }

    // Fetch the device token
    await _fetchDeviceToken();
  }

  Future<void> _fetchDeviceToken() async {
    try {
      if (Platform.isAndroid) {
        _deviceToken = await _firebaseMessaging.getToken();
        print('FCM Token for Android: $_deviceToken');
      } else if (Platform.isIOS) {
        _deviceToken = await _firebaseMessaging.getAPNSToken();
        print('APNS Token for iOS: $_deviceToken');
      }

      if (_deviceToken == null) {
        print('Failed to fetch device token.');
      }
    } catch (e) {
      print('Error fetching device token: $e');
    }
  }

  Future<void> _firebaseMessageHandler(RemoteMessage message) async {
    print('Received push message: ${message.notification?.title}');

    // Show notification using Flutter Local Notifications Plugin
    await _showNotification(message);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id', // Unique ID for the notification channel
        'your_channel_name', // Channel name visible to users
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      message.hashCode, // Unique ID for the notification
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      notificationDetails,
    );
  }

  Future<void> _createNotificationChannel() async {
    const androidNotificationChannel = AndroidNotificationChannel(
      'your_channel_id', // Must match the ID in AndroidNotificationDetails
      'your_channel_name', // Channel name
      description: 'This is your channel description',
      importance: Importance.max,
    );

    final androidFlutterLocalNotificationsPlugin =
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await androidFlutterLocalNotificationsPlugin
        ?.createNotificationChannel(androidNotificationChannel);
  }

  String? get deviceToken => _deviceToken;
}
