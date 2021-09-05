//data provider
import '../dataproviders/workout_dataProvider.dart';

import '../models/workout/workout.dart';

class WorkoutRepository {
  final workoutDataProvider = WorkoutDataProvider();

  Future<List<Workout>> getWorkouts() async {
    return await workoutDataProvider.getWorkouts();
  }
}
