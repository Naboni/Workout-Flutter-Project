import 'package:flutter/material.dart';
import 'package:project/data/models/workout/workout.dart';
//widgets
import '../widgets/exercise_type/exercise_appbar.dart';
import '../widgets/exercise_type/exercise_item.dart';
//model
import '../../data/models/exercise/exercise.dart';
// screen
import '../screens/training.dart';

class ExerciseType extends StatefulWidget {
  static const routeName = "exercise_type";

  final Workout workout;
  ExerciseType(this.workout);

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
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: [
            ExerciseAppBar(
              name: widget.workout.name,
              imgUrl: widget.workout.imgUrl,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
              child: Row(
                children: [
                  Text(
                    '${widget.workout.exercise.length * 20} secs',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.brightness_1, size: 5),
                  Text(
                    ' ${widget.workout.exercise.length} Workouts',
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
                        exercise: widget.workout.exercise[index],
                        position: index,
                        length: widget.workout.exercise.length,
                        exerciseList: widget.workout.exercise,
                      );
                    },
                    itemCount: widget.workout.exercise.length,
                  ),
                ),
              ),
            ),
            // Divider(),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Training.routeName, arguments: widget.workout);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: Container(
                  child: Center(
                    child: Text("START"),
                  ),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
