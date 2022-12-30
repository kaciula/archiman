import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:logging/logging.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // We need to initialize the timezones in order to schedule notifications
    tz.initializeTimeZones();
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(_androidDefaultIcon);
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: _onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  @pragma('vm:entry-point')
  static void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    _debugPrint('notification clicked response=$notificationResponse');
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    _debugPrint('notification tapped in background: $notificationResponse');
    DartPluginRegistrant.ensureInitialized();
  }

  Future<void> _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    _logger.fine(
        'notification clicked while in foreground $id, $title, $body, $payload');
  }

  Future<void> createAndroidNotificationChannel(
      {required String id, required String name}) async {
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin androidPlugin =
          _plugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!;
      await androidPlugin
          .createNotificationChannel(AndroidNotificationChannel(id, name));
    }
  }

  Future<void> showNotificationNow(
      {required String title, required String body, String? payload}) async {
    final AndroidNotificationDetails detailsAndroid =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: body,
      icon: _androidDefaultIcon,
    );
    final DarwinNotificationDetails detailsDarwin = DarwinNotificationDetails();
    final NotificationDetails details =
        NotificationDetails(android: detailsAndroid, iOS: detailsDarwin);
    await _plugin.show(_uniqueNotificationId(), title, body, details,
        payload: payload);
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime dateTime,
    String? payload,
  }) async {
    _logger.fine('Schedule notification for $dateTime');
    final AndroidNotificationDetails detailsAndroid =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: body,
      icon: _androidDefaultIcon,
    );
    final DarwinNotificationDetails detailsDarwin = DarwinNotificationDetails();
    final NotificationDetails details =
        NotificationDetails(android: detailsAndroid, iOS: detailsDarwin);
    await _plugin.zonedSchedule(
      _uniqueNotificationId(),
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      details,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
    );
  }

  Future<void> updateNotification(int notificationId,
      {required String title,
      required String body,
      required String channelId,
      required String channelName,
      String? actionId,
      String? actionText,
      String? payload}) async {
    final AndroidNotificationDetails detailsAndroid =
        AndroidNotificationDetails(
      channelId,
      channelName,
      importance: Importance.max,
      priority: Priority.high,
      ticker: body,
      icon: _androidDefaultIcon,
      actions: actionId != null && actionText != null
          ? [AndroidNotificationAction(actionId, actionText)]
          : null,
    );
    final DarwinNotificationDetails detailsDarwin = DarwinNotificationDetails();
    final NotificationDetails details =
        NotificationDetails(android: detailsAndroid, iOS: detailsDarwin);
    await _plugin.show(notificationId, title, body, details, payload: payload);
  }

  Future<bool> isPending(String payload) async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _plugin.pendingNotificationRequests();
    for (PendingNotificationRequest pendingNotification
        in pendingNotificationRequests) {
      _logger.fine(
          'Pending notification: ${pendingNotification.id} ${pendingNotification.payload}');
      if (payload == pendingNotification.payload) {
        return true;
      }
    }
    return false;
  }

  Future<void> clearAllNotifications() async {
    await _plugin.cancelAll();
  }

  int _uniqueNotificationId() {
    return (DateTime.now().millisecondsSinceEpoch -
            DateTime(2020).millisecondsSinceEpoch) ~/
        1000;
  }
}

void _debugPrint(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

const String stopServiceActionId = 'stop_service_action_id';

const String _androidDefaultIcon = '@mipmap/ic_launcher';
const String _channelId = 'notifications';
const String _channelName = ''; // FIXME: Android channel name/description
const String _channelDescription =
    ''; // FIXME: Android channel name/description

// ignore: unused_element
final Logger _logger = Logger('LocalNotificationService');
