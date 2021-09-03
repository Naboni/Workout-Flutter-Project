import 'package:flutter/material.dart';

// model
import '../../../data/models/reminder/reminder.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  const ReminderCard(
    this.reminder, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(reminder.time);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text(
              "reminder.time ?? ''",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Repeat'),
                      Text(
                        'Sun, Mon, Tue, Wendn, Thur, Fri, Sat',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.delete)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
