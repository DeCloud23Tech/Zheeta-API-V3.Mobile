import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize Firebase and push notifications
  static Future<void> initialize() async {
    // Initialize Firebase
    // await Firebase.initializeApp();

    // Initialize local notifications plugin
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
    InitializationSettings(android: androidSettings);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Set background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permissions for iOS
    await _requestPermissions();

    // Get the device token and send it to your backend for registration
    await _getDeviceTokenAndSendToBackend();

    // Listen for messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onMessageReceived(message);
    });

    // Handle when the app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _onMessageOpened(message);
    });
  }

  // Background handler for push notifications
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling background message: ${message.messageId}');
  }

  // Request notification permissions for iOS
  static Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted notification permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted notification permission');
    }
  }

  // Get device token and send it to the backend
  static Future<void> _getDeviceTokenAndSendToBackend() async {
    String? deviceToken = await _firebaseMessaging.getToken();
    if (deviceToken != null) {
      print('Device token: $deviceToken');
      // Send the token to your backend after user logs in
      // Example: await apiService.registerDeviceToken(deviceToken);
    } else {
      print('Failed to get device token');
    }
  }

  // Handle foreground messages
  static void _onMessageReceived(RemoteMessage message) async {
    print('Received message: ${message.notification?.title}');
    if (message.notification != null) {
      // Show a local notification using the Flutter local notifications plugin
      // await _showLocalNotification(message.notification!);
    }
  }

  // Handle notification tap when the app is in the background
  static void _onMessageOpened(RemoteMessage message) {
    print('User tapped on notification: ${message.notification?.title}');
    // Navigate to a specific screen or perform some action
  }

  // Show local notification
  // static Future<void> _showLocalNotification(Notification notification) async {
  //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     'your_channel_id',
  //     'your_channel_name',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //   );
  //   const NotificationDetails notificationDetails =
  //   NotificationDetails(android: androidDetails);
  //
  //   await _flutterLocalNotificationsPlugin.show(
  //     0,
  //     notification.title,
  //     notification.body,
  //     notificationDetails,
  //   );
  // }
}
