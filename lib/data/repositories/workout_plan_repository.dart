import 'dart:convert';

import 'package:project/data/dataproviders/workoutPlan_dataProvider.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

class WorkoutPlanRepository {
  // ? Instantiate workoutPlan data provider
  final workoutPlanDataProvider = WorkoutPlanDataProvider();

  Future<WorkoutPlan?> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    var plan = await workoutPlanDataProvider.addWorkoutPlan(workoutPlan);
    if (plan["status"] == "201") {
      return WorkoutPlan.fromJson(jsonDecode(plan["body"])["plan"]);
    }
    return null;
  }

  Future<WorkoutPlansResponse> getWorkoutPlans() async {
    var plans = await workoutPlanDataProvider.getWorkoutPlans();
    if (plans["status"] == "404") {
      return WorkoutPlansResponse()..plans = [];
    }
    return WorkoutPlansResponse.fromJson(jsonDecode(plans["body"]));
  }

  Future<WorkoutPlansResponse> searchWorkoutPlans(String title) async {
    var plans = await workoutPlanDataProvider.searchWorkoutPlans(title: title);
    if (plans["status"] == "404") {
      return WorkoutPlansResponse()..plans = [];
    }
    return WorkoutPlansResponse.fromJson(jsonDecode(plans["body"]));
  }

  Future<WorkoutPlan?> getWorkoutPlan(String id) async {
    var plans = await workoutPlanDataProvider.getWorkoutPlan(id: id);
    if (plans["status"] == "404") {
      return null;
    }
    return WorkoutPlan.fromJson(jsonDecode(plans["body"])["plan"]);
  }

  Future<bool> deleteWorkoutPlan(String id) async {
    var res = await workoutPlanDataProvider.deleteWorkoutPlan(id);
    return res;
  }
}
