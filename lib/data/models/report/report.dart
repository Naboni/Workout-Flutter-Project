import 'package:hive/hive.dart';

part 'report.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 4)
class Report extends HiveObject {
  @HiveField(0)
  late int duration;
  @HiveField(1)
  late int point;
  @HiveField(2)
  late String dateCreated;
  @HiveField(3)
  late String execiseName;

  @override
  String toString() {
    return 'Report(duration: $duration, point: $point, dateCreated: $dateCreated, execiseName: $execiseName)';
  }
}
