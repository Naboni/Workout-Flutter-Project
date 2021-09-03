import 'package:hive/hive.dart';

part 'reminder.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 0)
class Reminder extends HiveObject {
  @HiveField(0)
  late String time;
}
