

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';


class FirebaseNotificationSetup {
  final FirebaseMessaging _firebaseMessaging;
  final NotificationDisplayService _notificationDisplayService;

  FirebaseNotificationSetup(
      {required FirebaseMessaging firebaseMessaging,
        required NotificationDisplayService notificationDisplayService})
      : _firebaseMessaging = firebaseMessaging,
        _notificationDisplayService = notificationDisplayService;

  Future<void> initNotification(BuildContext context) async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    log('Token: $fcmToken');

    // Background and terminated states
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message, context);
    });

    // Foreground state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _notificationDisplayService.displayNotification(
          context, message.notification?.title ?? "No Title",
          message.notification?.body ?? "No Body");
    });
  }

  void _handleMessage(RemoteMessage message, BuildContext context) {
    // Add any navigation or additional logic here for background/terminated state handling
  }
}

class NotificationDisplayService {
  void displayNotification(BuildContext context, String title, String body) {
    // Using Snackbar as requested for foreground notifications
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title\n$body'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

// Usage:
// Call this in your main widget or where you initialize notifications, passing necessary context.
void setupNotifications(BuildContext context) {
  final firebaseNotificationSetup = FirebaseNotificationSetup(
    firebaseMessaging: FirebaseMessaging.instance,
    notificationDisplayService: NotificationDisplayService(),
  );

  firebaseNotificationSetup.initNotification(context);
}
