// models
import 'package:project/data/models/day/day.dart';
import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/data/models/workoutPlan/workout_plan_new/workout_plan.dart';
import 'package:project/data/models/workoutPlan/workout_plan_new/workout_response.dart';

import '../models/workoutPlan/workoutPlan.dart';

class WorkoutPlanDataProvider {
  Future<void> addWorkoutPlan(Plan workoutPlan) async {
    // send post req to backend
  }

  Future<void> deleteWorkoutPlan(String workoutPlan) async {
    // send delete req to backend
  }

  Future<WorkoutResponse> getWorkoutPlans() async {
    return WorkoutResponse.fromJson("json");
  }
}
