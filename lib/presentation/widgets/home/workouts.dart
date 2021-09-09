import 'package:flutter/material.dart';

//model
import '../../../data/models/workout/workout.dart';
//widgets
import 'workout_item.dart';

class Workouts extends StatelessWidget {
  final List<Workout> workouts;
  const Workouts(
    this.workouts, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: workouts.map((workout) => WorkoutsListItem(workout)).toList(),
      ),
    );
  }
}
