import 'package:flutter/material.dart';
import 'package:project/constants/data.dart';
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
  void _showSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  final _formKey = GlobalKey<FormState>();
  var title = "c";
  var age = "";
  var description = "";
  int _dificultyIndex = 1;
  _changeDifficultyLevel(int newIndex) {
    setState(() {
      _dificultyIndex = newIndex;
    });
  }

  List<Map<String, dynamic>> _targetMuscles = [
    {"name": "Warmup", "value": false},
    {"name": "Abs", "value": false},
    {"name": "Legs", "value": false},
  ];
  _changeTargetMuscles(index, bool) {
    setState(() {
      _targetMuscles[index]["value"] = bool;
    });
  }

  // We start with all days not selected.
  final values = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Title("ADD A WORKOUT PLAN"),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: 'Input text',
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Required field";
                            return null;
                          },
                          onSaved: (val) => title = val!,
                          decoration: InputDecoration(
                            labelText: "Title",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          initialValue: 'Input text',
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "Required field";
                            return null;
                          },
                          onSaved: (val) => age = val!,
                          decoration: InputDecoration(
                            labelText: "Target age",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: 'Input text',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required field";
                      }
                      return null;
                    },
                    maxLines: 2,
                    onSaved: (val) => description = val!,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Title("Dificulty"),
            WorkoutDificulty(_dificultyIndex, _changeDifficultyLevel),
            Title("Target Muscles"),
            MuscleTarget(_targetMuscles, _changeTargetMuscles),
            Title("Select week days"),
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
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var indexList = [];
                  for (var i = 0; i < values.length; i++) {
                    if (values[i]) {
                      indexList.add(i);
                    }
                  }

                  if (indexList.length > 0) {
                    _targetMuscles = _targetMuscles
                        .where((element) => element['value'])
                        .toList();
                    widget.setNewIndex(
                      1,
                      {
                        "title": title,
                        "age": age,
                        "description": description,
                        "dificulty": _dificultyIndex,
                        "targetMuscles": _targetMuscles,
                        "weekDays": indexList,
                      },
                    );
                  } else {
                    _showSnackBar("Please select all required fields.");
                  }
                }
              },
              child: Container(height: 50, child: Center(child: Text("Next"))),
            )
          ],
        ),
      ),
    );
  }

  Text Title(String t) {
    return Text(
      t,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey[600],
      ),
    );
  }
}
