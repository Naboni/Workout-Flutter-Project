import 'package:flutter/material.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

class PlanStat extends StatelessWidget {
  final List<WorkoutPlan> workouts;
  const PlanStat(this.workouts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                workouts.length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("WORKOUT"),
            ],
          ),
        ],
      ),
    );
  }
}
