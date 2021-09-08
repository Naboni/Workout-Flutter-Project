import 'package:flutter/material.dart';
import 'package:project/data/models/exercise/exercise.dart';

// deps
import 'package:weekday_selector/weekday_selector.dart';
// model
import '../../../../data/models/workoutPlan/workoutPlan.dart';
// widgets
import 'muscle_target.dart';
import 'workout_dificulty.dart';

class StepOne extends StatefulWidget {
  // global key to identify the form and for validation
  final Function setNewIndex;

  StepOne(this.setNewIndex, {Key? key}) : super(key: key);

  @override
  _StepOneState createState() => _StepOneState();
}

// ! EXtract titles

class _StepOneState extends State<StepOne> {
  final _formKey = GlobalKey<FormState>();
  // We start with all days selected.
  final values = List.filled(7, true);
  WorkoutPlan _workoutPlan = WorkoutPlan();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Start",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      buldFormFied("Title"),
                      SizedBox(width: 10),
                      buldFormFied("Target age"),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Dificulty",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            WorkoutDificulty(),
            Text(
              "Target Muscles",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            MuscleTarget(),
            SizedBox(height: 20),
            Text(
              "Select week days",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            WeekdaySelector(
              onChanged: (int day) {
                setState(() {
                  final index = day % 7;
                  values[index] = !values[index];
                });
              },
              values: values,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState!.save();
                // widget.setNewIndex(
                //   1,
                //   _workoutPlan
                //     ..title = "ass"
                //     ..description = "dec"
                //     ..exercise = [Exercise()..name = "ass"],
                // );
              },
              child: Container(height: 50, child: Center(child: Text("Next"))),
            )
          ],
        ),
      ),
    );
  }

  Expanded buldFormFied(String label) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
