import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class LocalNotificationsService {
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    try {
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  static Future<void> scheduleNotification({
    required DateTime scheduledTime,
    required String title,
    required String body,
    required String id,
  }) async {
    DateTime now = DateTime.now();
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(
        seconds: 1,
      ));
    }

    final tz.TZDateTime tzScheduledTime =
        tz.TZDateTime.from(scheduledTime, tz.local);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '2',
      'Notifi',
      channelDescription: 'your_channel_description',
      importance: Importance.high,
      priority: Priority.max,
    );

    const NotificationDetails notifiDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    int notifiId = int.tryParse(id) ?? 0;
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notifiId,
      title,
      body,
      tzScheduledTime,
      notifiDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> configureTimezone() async {
    tz.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation("Africa/Cairo"));
  }
}
