import '../models/reminder/reminder.dart';
import '../dataproviders/reminder_dataProvider.dart';

class ReminderRepository {
  // ? Instantiate reminder data provider
  final reminderDataProvider = ReminderDataProvider();

  Future<void> saveReminder(Reminder reminder) async {
    await reminderDataProvider.saveReminder(reminder);
  }

  Future<List<Reminder>>? getReminders() async {
    return await reminderDataProvider.getReminders();
  }

  Future<void> deleteReminder(Reminder reminder) async {
    return await reminderDataProvider.deleteReminder(reminder);
  }
}
