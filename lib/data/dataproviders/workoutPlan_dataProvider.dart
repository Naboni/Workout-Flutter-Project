// models
import 'package:project/data/models/day/day.dart';
import 'package:project/data/models/exercise/exercise.dart';

import '../models/workoutPlan/workoutPlan.dart';

class WorkoutPlanDataProvider {
  Future<void> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    // send post req to backend
  }

  Future<void> deleteWorkoutPlan(WorkoutPlan workoutPlan) async {
    // send delete req to backend
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() async {
    return [
      WorkoutPlan()
        ..title = "sample t"
        ..description = "sample d"
        ..days = [
          Day(1, [
            Exercise()
              ..id = "1"
              ..name = "sample n"
              ..category = "arm"
              ..description = "sample d"
              ..difficulty = "1"
              ..duration = "20"
              ..lottieUrl = "assets/anim/workouts/abs/seated-abs-circles.json"
          ])
        ]
    ];
  }
}
