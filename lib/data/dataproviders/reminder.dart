// models
import '../models/reminder/reminder.dart';

import '../boxes.dart';

class ReminderDataProvider {
  final _box = Boxes.getReminders();

  Future<void> saveReminder(String time) async {
    final reminder = Reminder()..time = time;
    _box.add(reminder);
  }

  Future<List<Reminder>> getReminders() async {
    return _box.values.toList().cast<Reminder>();
  }
}
