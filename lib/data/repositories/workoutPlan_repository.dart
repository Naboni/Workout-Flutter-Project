import 'package:project/data/dataproviders/workoutPlan_dataProvider.dart';
import 'package:project/data/models/workoutPlan/workoutPlan.dart';

class WorkotPlanRepository {
  // ? Instantiate workoutPlan data provider
  final workoutPlanDataProvider = WorkoutPlanDataProvider();

  Future<void> saveReminder(WorkoutPlan workoutPlan) async {
    await workoutPlanDataProvider.addWorkoutPlan(workoutPlan);
  }

  Future<List<WorkoutPlan>> getReminders() async {
    return await workoutPlanDataProvider.getWorkoutPlans();
  }

  Future<void> deleteReminder(WorkoutPlan workoutPlan) async {
    return await workoutPlanDataProvider.deleteWorkoutPlan(workoutPlan);
  }
}
