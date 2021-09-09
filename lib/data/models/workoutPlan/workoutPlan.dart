import 'package:hive/hive.dart';
// models
import 'package:project/data/models/day/day.dart';

part 'workoutPlan.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 3)
class WorkoutPlan extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late List<Day> days;

  WorkoutPlan();

  WorkoutPlan.fromJson(
    Map<dynamic, dynamic> json,
    List<Map<String, Object>> dayJson,
  )   : title = json['title'],
        description = json['description'],
        days = dayJson.map<Day>((day) {
          return Day.fromJson(day);
        }).toList();

  @override
  String toString() =>
      'WorkoutPlan(title: $title, description: $description, days: $days)';
}
