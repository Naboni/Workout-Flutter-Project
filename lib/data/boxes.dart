import 'package:hive/hive.dart';

// models
import './models/reminder/reminder.dart';
import './models/workout/workout.dart';

// ? List of all boxes
class Boxes {
  static Box getReminders() => Hive.box<Reminder>('reminders');
  static Box getWorkouts() => Hive.box<Workout>('workouts');
}
