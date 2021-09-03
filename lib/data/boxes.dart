import 'package:hive/hive.dart';

// models
import './models/reminder/reminder.dart';

// ? List of all boxes
class Boxes {
  static Box getReminders() => Hive.box<Reminder>('reminders');
}
