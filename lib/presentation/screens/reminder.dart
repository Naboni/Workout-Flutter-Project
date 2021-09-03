import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
// deps
import 'package:bloc/bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:project/main.dart';

// bloc
import '../../logic/bloc/reminder/reminder.dart';

// models
import '../../data/models/reminder/reminder.dart';

// widgets
import '../widgets/reminder/reminder_card.dart';
import '../widgets/reminder/day_selector.dart';

class ReminderScreen extends StatefulWidget {
  static const routeName = "reminderScreen";
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Reminder'),
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.2,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      // drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: BlocBuilder<ReminderBloc, ReminderState>(
            builder: (_, reminderState) {
              if (reminderState is ReminderInitial) {
                return CircularProgressIndicator();
              }
              if (reminderState is ReminderFailed) {
                return Text("Sorry loading failed");
              }
              if (reminderState is ReminderLoaded) {
                final _reminders = reminderState.reminders;
                return ListView.builder(
                  itemBuilder: (_, index) {
                    return ReminderCard(_reminders[index]);
                  },
                  itemCount: _reminders.length,
                );
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectTime(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

void scheduleAlarm() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Detroit'));
  var scheduledNotificationDateTime = tz.TZDateTime.now(tz.local).add(
    const Duration(seconds: 5),
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
    "Sex",
    "Let Boni suck your dick",
    scheduledNotificationDateTime,
    platformChannelSpecifics,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true,
  );
}

Future<Null> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialEntryMode: TimePickerEntryMode.dial,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DaySelector(),
    ).then(
      (value) => {addReminder(context, picked.toString())},
    );
  }
}

addReminder(BuildContext context, String time) {
  final reminderBloc = BlocProvider.of<ReminderBloc>(context);
  final reminder = Reminder()..time = time;
  reminderBloc.add(AddReminder(reminder));
}
// Container(
//                   margin: EdgeInsets.symmetric(vertical: 5),
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         width: 1,
//                         color: Colors.grey,
//                       )),
//                   child: Text('ti'),
//                 );
