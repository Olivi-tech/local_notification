import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

//////////
class LocalNotifications {
  static AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  //below is for IOS
  static DarwinInitializationSettings darwinInitializationSettings =
      const DarwinInitializationSettings(
    requestCriticalPermission: true,
    /* By Default true
    requestBadgePermission: true,
    requestAlertPermission: true,
    requestSoundPermission: true,
    */
  );

  static notificationIntilization() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    bool? isInitilized =
        await notificationsPlugin.initialize(initializationSettings);
    log('////////////////////isInitilized = $isInitilized/////////////////');
  }

  static AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    '0',
    'youtube Channel',
    importance: Importance.max,
    priority: Priority.max,
  );
  static DarwinNotificationDetails darwinNotificationDetails =
      const DarwinNotificationDetails(
    presentSound: true,
    subtitle: 'I am subtitle',
    presentAlert: true,
    presentBadge: true,
    interruptionLevel: InterruptionLevel.critical,
  );
  static NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: darwinNotificationDetails);
  static showNotification() async {
    await notificationsPlugin.show(
        0, 'title', 'I am body', notificationDetails);
  }

  static scheduleTime() {
    //you have to initilize timezone in main fun to call this fun properly
    // have 3 versions: so import should be of import 'package:timezone/data/latest_10y.dart';
    DateTime scheduledDate = DateTime.now().add(const Duration(seconds: 5));
    notificationsPlugin.zonedSchedule(
      0,
      'Scheduled title',
      'Scheduled body',
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
    );
  }
}
