import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../logic/bloc/reminder/reminder.dart';

// models
import '../../data/models/reminder/reminder.dart';

// widgets
import '../widgets/reminder/reminder_card.dart';
import '../widgets/reminder/day_selector.dart';

// utils
import '../../utils/notification.dart';

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
                if (_reminders.length == 0) {
                  return Center(
                    child: Text("NO REMINDERS SET"),
                  );
                }
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
      (value) => {if (value != null) addReminder(context, picked, value)},
    );
  }
}

addReminder(BuildContext context, TimeOfDay time, List<bool> weekDays) {
  final reminderBloc = BlocProvider.of<ReminderBloc>(context);
  // change array of bools to array of ints
  var indexList = [];
  for (var i = 0; i < weekDays.length; i++) {
    if (weekDays[i]) {
      indexList.add(i);
    }
  }
  scheduleAlarm(time.hour, time.minute);
  final reminder = Reminder()
    ..time = time.format(context)
    ..days = indexList;
  reminderBloc.add(AddReminder(reminder));
}
