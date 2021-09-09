import 'package:hive/hive.dart';

// models
import './models/reminder/reminder.dart';
import './models/workout/workout.dart';
import './models/report/report.dart';

// ? List of all boxes
class Boxes {
  static Box getReminders() => Hive.box<Reminder>('reminders');
  static Box getWorkouts() => Hive.box<Workout>('workouts');
  static Box getReport() => Hive.box<Report>('report');
}
