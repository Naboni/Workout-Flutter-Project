import 'package:project/data/dataproviders/workoutPlan_dataProvider.dart';
import 'package:project/data/models/workoutPlan/workout_plan_new/workout_plan_response.dart';

class WorkotPlanRepository {
  // ? Instantiate workoutPlan data provider
  final workoutPlanDataProvider = WorkoutPlanDataProvider();

  Future<void> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    await workoutPlanDataProvider.addWorkoutPlan(workoutPlan);
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() async {
    return await workoutPlanDataProvider.getWorkoutPlans();
  }

  Future<void> deleteWorkoutPlan(String workoutPlanId) async {
    return await workoutPlanDataProvider.deleteWorkoutPlan(workoutPlanId);
  }
}
