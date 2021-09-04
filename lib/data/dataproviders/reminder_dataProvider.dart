// models
import '../models/reminder/reminder.dart';

import '../boxes.dart';

class ReminderDataProvider {
  final _box = Boxes.getReminders();

  Future<void> saveReminder(Reminder reminder) async {
    final _reminder = Reminder()
      ..time = reminder.time
      ..days = reminder.days;
    _box.add(_reminder);
  }

  Future<List<Reminder>> getReminders() async {
    return _box.values.toList().cast<Reminder>();
  }

  Future<void> deleteReminder(Reminder reminder) async {
    return reminder.delete();
  }
}
