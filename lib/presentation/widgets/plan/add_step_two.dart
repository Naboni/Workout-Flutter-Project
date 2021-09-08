import 'package:flutter/material.dart';

// model
import '../../../data/models/workoutPlan/workoutPlan.dart';

class StepTwo extends StatelessWidget {
  final Function setNewIndex;
  final WorkoutPlan workoutPlan;
  const StepTwo(this.setNewIndex, this.workoutPlan, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose exercises",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 5),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(right: 5),
                color: Colors.amber,
              ),
              itemCount: 5,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setNewIndex(0);
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
