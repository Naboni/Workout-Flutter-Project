import 'dart:math';

import 'package:flutter/material.dart';
// deps
import 'package:weekday_selector/weekday_selector.dart';

// widgets
import 'muscle_target.dart';
import 'workout_dificulty.dart';

import '../../../../constants/data.dart';

class StepOne extends StatefulWidget {
  // global key to identify the form and for validation
  final Function setNewIndex;
  StepOne(this.setNewIndex, {Key? key}) : super(key: key);

  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  void _showSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  final _formKey = GlobalKey<FormState>();
  var title = "c";
  var age = "";
  var description = "";
  var imgUrl = "";
  _changeImageUrl(String url) {
    imgUrl = url;
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10),
            RefreshImg(_changeImageUrl),
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
                          initialValue: 'Test Title 1',
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
                          initialValue: '23-25',
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
                    initialValue:
                        'This is a sample description for a workout plan. This workout plan should help you become a better version of your self by putting you in a good shape and physical health.',
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
            Title("Difficulty"),
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
                        "imgUrl": imgUrl,
                        "title": title,
                        "age": age,
                        "description": description,
                        "difficulty": _dificultyIndex,
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
            ),
            SizedBox(height: 10),
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

class RefreshImg extends StatefulWidget {
  final Function change;
  RefreshImg(
    this.change, {
    Key? key,
  }) : super(key: key);

  @override
  _RefreshImgState createState() => _RefreshImgState();
}

class _RefreshImgState extends State<RefreshImg> {
  final _random = new Random();

  String? _imgUrl;
  _getRandomImgUrl() {
    setState(() {
      _imgUrl = imgList[_random.nextInt(imgList.length)];
    });
    widget.change(_imgUrl);
  }

  @override
  void initState() {
    // TODO: implement initState
    _getRandomImgUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imgUrl!),
                fit: BoxFit.cover,
              ),
            ),
            height: 120,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: _getRandomImgUrl,
              child: Text("Change image"),
            ),
          )
        ],
      ),
    );
  }
}
