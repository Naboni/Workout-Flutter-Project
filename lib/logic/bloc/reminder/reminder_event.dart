part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();

  @override
  List<Object> get props => [];
}

class AddReminder extends ReminderEvent {
  final Reminder reminder;
  AddReminder(this.reminder);
}

class DeleteReminder extends ReminderEvent {
  final Reminder reminder;
  DeleteReminder(this.reminder);
}

class GetReminders extends ReminderEvent {}
