import 'package:flutter/material.dart';
import 'package:project/data/models/workoutPlan/workoutPlan.dart';

class MyPlanItem extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  const MyPlanItem(this.workoutPlan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workoutPlan.title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
