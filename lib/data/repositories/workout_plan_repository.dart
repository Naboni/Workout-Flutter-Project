import 'package:project/data/dataproviders/workoutPlan_dataProvider.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

class WorkoutPlanRepository {
  // ? Instantiate workoutPlan data provider
  final workoutPlanDataProvider = WorkoutPlanDataProvider();

  Future<void> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    await workoutPlanDataProvider.addWorkoutPlan(workoutPlan);
  }

  Future<WorkoutPlansResponse> getWorkoutPlans() async {
    // return await workoutPlanDataProvider.getWorkoutPlans();
    return WorkoutPlansResponse()..plans = [];
  }

  Future<void> deleteWorkoutPlan(String workoutPlanId) async {
    return await workoutPlanDataProvider.deleteWorkoutPlan(workoutPlanId);
  }
}
