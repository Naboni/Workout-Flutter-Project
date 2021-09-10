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
  //! //! //! //! //! //! //! //! //! //! //! //! //! //!

  //RETURNS NULL IF THE WORKOUT PLAN IS ALREADY IN FAVORITE
  Future<bool> favorWorkoutPlan(String planId) async {
    var res = await workoutPlanDataProvider.favorPlan(planId: planId);
    if (res["status"] == "201") {
      return true;
    }
    return false;
  }

  Future<bool> unfavorWorkoutPlan(String planId) async {
    var res = await workoutPlanDataProvider.unfavorPlan(planId: planId);
    return true;
  }

  //RETURNS NULL IF THERE ARE NO FAVORED PLANS
  Future<List<WorkoutPlan>?> getFavoredPlans() async {
    List<WorkoutPlan>? plans;
    var res = await workoutPlanDataProvider.getFavoredPlans();
    if (res["status"] == "204") {
      return null;
    }
    plans = [];
    var workoutList = jsonDecode(res["body"])["plans"];
    workoutList.forEach((v) {
      plans?.add(WorkoutPlan.fromJson((v["plan"])));
    });
    return plans;
  }
}
