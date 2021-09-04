import 'dart:async';

import 'package:bloc/bloc.dart';
// model
import 'package:project/data/models/reminder/reminder.dart';
// bloc
import 'reminder.dart';
// repository
import '../../../data/repositories/reminder_repository.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final ReminderRepository reminderRepository;
  ReminderBloc(this.reminderRepository) : super(ReminderInitial());

  @override
  Stream<ReminderState> mapEventToState(
    ReminderEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetReminders) {
      // load
      yield ReminderInitial();
      final _reminders = await reminderRepository.getReminders();
      yield ReminderLoaded(_reminders);
    }
    if (event is AddReminder) {
      final _reminder = event.reminder;
      await reminderRepository.saveReminder(_reminder);
      final _reminders = await reminderRepository.getReminders();
      yield ReminderLoaded(_reminders);
    }
    if (event is DeleteReminder) {
      final _reminder = event.reminder;
      await reminderRepository.deleteReminder(_reminder);
      final _reminders = await reminderRepository.getReminders();
      yield ReminderLoaded(_reminders);
    }
  }
}
