//data provider
import '../dataproviders/workout_dataProvider.dart';
// constants
import 'package:project/constants/data.dart';
// models
import 'package:project/data/models/exercise/exercise.dart';
import '../models/workout/workout.dart';

class WorkoutRepository {
  final workoutDataProvider = WorkoutDataProvider();

  Future<List<Workout>> getWorkouts() async {
    return await workoutDataProvider.getWorkouts();
  }

  Future<void> updateWorkout(int index, Workout workout) async {
    await workoutDataProvider.updateWorkout(index, workout);
  }

  Future<List<Exercise>> getExercises(stepResult) async {
    List<Workout> data = await workoutDataProvider.getWorkouts();
    var exercisesChunk = data.map((workout) => workout.exercise).toList();
    List<Exercise> listOfExercises = [];

    for (var exerciseList in exercisesChunk) {
      for (var exercise in exerciseList) {
        if (stepResult['dificulty'] == -1) {
          if (stepResult['targetMuscles'].length == 0) {
            listOfExercises.add(exercise);
          } else {
            for (var item in stepResult['targetMuscles']) {
              if (exercise.category == item['name'].toString().toLowerCase()) {
                listOfExercises.add(exercise);
              }
            }
          }
        } else if (exercise.difficulty ==
            difficulty[stepResult['difficulty'] - 1].toString()) {
          if (stepResult['targetMuscles'].length == 0) {
            listOfExercises.add(exercise);
          } else {
            if (exercise.difficulty ==
                difficulty[stepResult['difficulty'] - 1].toString()) {
              if (stepResult['targetMuscles'].length == 0) {
                listOfExercises.add(exercise);
              } else {
                for (var item in stepResult['targetMuscles']) {
                  if (exercise.category ==
                      item['name'].toString().toLowerCase()) {
                    listOfExercises.add(exercise);
                  }
                }
              }
            }
          }
        }
      }
    }
    return listOfExercises;
  }
}
