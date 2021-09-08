import 'package:project/data/dataproviders/workoutPlan_dataProvider.dart';
import 'package:project/data/models/workoutPlan/workoutPlan.dart';

class WorkotPlanRepository {
  // ? Instantiate workoutPlan data provider
  final workoutPlanDataProvider = WorkoutPlanDataProvider();

  Future<void> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    await workoutPlanDataProvider.addWorkoutPlan(workoutPlan);
  }

  Future<List<WorkoutPlan>> getWorkoutPlans() async {
    return await workoutPlanDataProvider.getWorkoutPlans();
  }

  Future<void> deleteWorkoutPlan(WorkoutPlan workoutPlan) async {
    return await workoutPlanDataProvider.deleteWorkoutPlan(workoutPlan);
  }
}
