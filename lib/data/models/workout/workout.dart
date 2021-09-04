import 'package:hive/hive.dart';

part 'workout.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 2)
class Workout extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String imgUrl;
  @HiveField(2)
  late var exercise;
}
