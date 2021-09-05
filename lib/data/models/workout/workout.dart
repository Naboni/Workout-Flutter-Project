import 'package:hive/hive.dart';

// models
import '../exercise/exercise.dart';

part 'workout.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 2)
class Workout extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String imgUrl;
  @HiveField(3)
  late List<Exercise> exercise;

  Workout();

  Workout.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imgUrl = json['imgUrl'],
        exercise = json['exercise'].map<Exercise>((ex) {
          return Exercise.fromJson(ex);
        }).toList();
}
