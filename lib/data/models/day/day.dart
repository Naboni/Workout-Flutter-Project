// models
import '../exercise/exercise.dart';

class Day {
  final int day;
  final List<Exercise> exercises;

  Day(this.day, this.exercises);

  Day.fromJson(Map<String, dynamic> json)
      : day = json['day'],
        exercises = json['exercises'].map<Exercise>((ex) {
          return Exercise.fromJson(ex);
        }).toList();

  @override
  String toString() => 'Day(day: $day, exercises: $exercises)';
}
