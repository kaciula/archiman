// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class PushNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Do not await here because it may be blocking forever if no Internet
    _messaging
        .subscribeToTopic('announcements')
        .onError((error, stackTrace) => {
              // Do nothing here. There is probably no Internet connection
            });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.fine('Got a message whilst in the foreground!');
      _logger.fine('Message data: ${message.data}');

      if (message.notification != null) {
        _logger.fine(
          'Message also contained a notification: ${message.notification}',
        );
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Got a message whilst in background!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
        'Message also contained a notification: ${message.notification!.title}',
      );
    }
  }
}

// ignore: unused_element
final Logger _logger = Logger('PushNotificationService');
