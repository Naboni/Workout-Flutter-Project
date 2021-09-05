import 'package:flutter/material.dart';
//deps
import 'package:lottie/lottie.dart';
// model
import '../../../data/models/exercise/exercise.dart';

// widgets
import 'exercise_modal.dart';

class ExerciseItem extends StatelessWidget {
  final Exercise exercise;
  final int position;
  final int length;
  final List<Exercise> exerciseList;
  const ExerciseItem({
    Key? key,
    required this.exercise,
    required this.position,
    required this.length,
    required this.exerciseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDetails(context, position, length, exerciseList);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              width: 100,
              child: Lottie.asset(exercise.lottieUrl),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(exercise.name),
                Text(
                  exercise.duration,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showDetails(
  BuildContext context,
  int position,
  int length,
  List exerciseList,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) => ExerciseModal(
      position: position,
      length: length,
      exerciseList: exerciseList as List<Exercise>,
    ),
  ).then(
    (value) => {if (value != null) {}},
  );
}
