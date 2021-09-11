import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
// bloc
import '../../logic/bloc/reminder/reminder.dart';

// models
import '../../data/models/reminder/reminder.dart';

// widgets
import '../widgets/reminder/reminder_card.dart';
import '../widgets/reminder/day_selector.dart';
import 'navigation_drawer.dart';

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
  void initState() {
    // TODO: implement initState
    context.read<ReminderBloc>().add(GetReminders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('REMINDER'),
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      // drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: BlocBuilder<ReminderBloc, ReminderState>(
            builder: (_, reminderState) {
              print(reminderState);
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * .25,
                      width: double.infinity,
                      child: Lottie.asset('assets/anim/empty.json'),
                    ),
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
    addReminder(context, picked);
  }
}

addReminder(BuildContext context, TimeOfDay time) {
  final reminderBloc = BlocProvider.of<ReminderBloc>(context);
  scheduleAlarm(time.hour, time.minute);
  final reminder = Reminder()
    ..time = time.format(context)
    ..days = [];
  reminderBloc.add(AddReminder(reminder));
}
