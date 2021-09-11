part of 'reminder_bloc.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();

  @override
  List<Object> get props => [];
}

class ReminderInitial extends ReminderState {}

class ReminderLoaded extends ReminderState {
  final List<Reminder> reminders;
  ReminderLoaded(this.reminders);
}

class ReminderFailed extends ReminderState {}
