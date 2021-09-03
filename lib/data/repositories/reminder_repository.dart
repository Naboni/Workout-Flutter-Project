import '../models/reminder/reminder.dart';
import '../dataproviders/reminder.dart';

class ReminderRepository {
  // ? Instantiate reminder data provider
  final reminderDataProvider = ReminderDataProvider();

  Future<void> saveReminder(String time) async {
    await reminderDataProvider.saveReminder(time);
  }

  Future<List<Reminder>> getReminders() async {
    return await reminderDataProvider.getReminders();
  }
}
