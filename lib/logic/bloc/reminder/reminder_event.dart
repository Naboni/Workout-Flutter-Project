import '../../../data/models/reminder/reminder.dart';

abstract class ReminderEvent {}

class AddReminder extends ReminderEvent {
  final Reminder reminder;
  AddReminder(this.reminder);
}

class GetReminders extends ReminderEvent {}
