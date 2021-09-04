// deps
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../main.dart';

void scheduleAlarm(int hr, int min) async {
  var minDif = (DateTime.now().minute - min).abs();
  var hrDif = (DateTime.now().hour - hr).abs();
  var hrToMin = (hrDif * 60) + minDif;
  print("$hrDif $minDif {$hrToMin}");

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.local);
  var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(
    Duration(minutes: hrToMin),
  );
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'chennel for notif',
    icon: 'ic',
  );
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    "Local Notification",
    "Trial Notification",
    scheduledNotificationDateTime,
    platformChannelSpecifics,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true,
  );
}
