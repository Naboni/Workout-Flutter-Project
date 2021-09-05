import 'package:flutter/material.dart';
//widgets
import '../widgets/exercise_type/exercise_appbar.dart';
import '../widgets/exercise_type/exercise_footer.dart';
import '../widgets/exercise_type/exercise_item.dart';
//model
import '../../data/models/exercise/exercise.dart';

class ExerciseType extends StatefulWidget {
  static const routeName = "exercise_type";
  final List<Exercise> exercises;
  ExerciseType(this.exercises);

  @override
  _ExerciseTypeState createState() => _ExerciseTypeState();
}

class _ExerciseTypeState extends State<ExerciseType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            ExerciseAppBar(),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
              // margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '10 mins ',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.brightness_1, size: 5),
                  Text(
                    ' 11 Workouts',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ExerciseItem(
                        exercise: widget.exercises[index],
                        position: index,
                        length: widget.exercises.length,
                        exerciseList: widget.exercises,
                      );
                    },
                    itemCount: widget.exercises.length,
                  ),
                ),
              ),
            ),
            Divider(),
            ExerciseFooter(),
          ],
        ),
      ),
    );
  }
}
