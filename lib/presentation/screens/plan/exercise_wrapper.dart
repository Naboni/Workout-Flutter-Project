import 'package:flutter/material.dart';
import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/presentation/widgets/exercise_type/exercise_item.dart';

class ExerciseWrapper extends StatelessWidget {
  final List<Exercise> exercises;
  ExerciseWrapper(this.exercises);
  static const routeName = 'exList';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXERCISES'),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ExerciseItem(
              exercise: exercises[index],
              position: index,
              length: exercises.length,
              exerciseList: exercises);
        },
        itemCount: exercises.length,
      ),
    );
  }
}
