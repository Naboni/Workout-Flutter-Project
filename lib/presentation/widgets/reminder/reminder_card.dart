import 'package:flutter/material.dart';

// deps
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc
import '../../../logic/bloc/reminder/reminder.dart';
// model
import '../../../data/models/reminder/reminder.dart';
// constants
import '../../../constants/data.dart';

// widgets
import 'delete_confirmation.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  const ReminderCard(
    this.reminder, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // instance for deletion
    final _reminderBloc = BlocProvider.of<ReminderBloc>(context);
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reminder.time,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Repeat', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 5),
                        Container(
                          height: 15,
                          width: MediaQuery.of(context).size.width * .7,
                          child: reminder.days.length > 0
                              ? ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return Text(
                                      stringDays[reminder.days[index]],
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                  itemCount: reminder.days.length,
                                  separatorBuilder: (_, __) => Text(", ",
                                      style: TextStyle(color: Colors.grey)),
                                )
                              : Text("No Repeat",
                                  style: TextStyle(color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DeleteConfirmation(),
                      ).then(
                        // ? check if it popped with yes
                        (value) => {
                          if (value == "yes")
                            {_reminderBloc.add(DeleteReminder(reminder))}
                        },
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
