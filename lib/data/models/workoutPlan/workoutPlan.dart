import 'package:hive/hive.dart';
// models
import '../exercise/exercise.dart';

part 'workoutPlan.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 3)
class WorkoutPlan extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late List<Exercise> exercise;

  WorkoutPlan();
}
