import 'package:hive/hive.dart';
// models
import 'package:project/data/models/day/day.dart';

class WorkoutPlan extends HiveObject {
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!ID
  late String id;
  late String title;
  late String description;
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
