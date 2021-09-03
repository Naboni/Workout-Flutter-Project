import '../../../data/models/reminder/reminder.dart';

abstract class ReminderState {}

class ReminderInitial extends ReminderState {}

class ReminderLoaded extends ReminderState {
  final List<Reminder> reminders;
  ReminderLoaded(this.reminders);
}

class ReminderFailed extends ReminderState {}
