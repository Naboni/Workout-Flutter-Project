import 'package:flutter/material.dart';
import 'package:project/constants/data.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/presentation/screens/plan/exercise_wrapper.dart';

class DaysItem extends StatelessWidget {
  final Workouts workout;
  const DaysItem(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(ExerciseWrapper.routeName,
            arguments: workout.exercises!);
      },
      title: Text('Day ${workout.day}  (${stringDays[workout.day!]})'),
      subtitle: Text("Exercises: ${workout.exercises!.length}"),
    );
  }
}
