import 'dart:convert';
import 'package:flutter/services.dart';

// models
import '../models/workout/workout.dart';

import '../boxes.dart';

class WorkoutDataProvider {
  final _box = Boxes.getWorkouts();

  Future<void> saveWorkouts() async {
    final String response =
        await rootBundle.loadString('assets/workoutPlaceHolder.json');
    final data = await json.decode(response);

    var wks = data["workouts"].map((workout) => Workout.fromJson(workout));
    // ! clear table before populating
    _box.clear();
    wks.forEach((w) => {_box.add(w)});
  }

  Future<List<Workout>> getWorkouts() async {
    return _box.values.toList().cast<Workout>();
  }
}
