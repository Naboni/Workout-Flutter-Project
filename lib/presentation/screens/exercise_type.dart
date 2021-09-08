import 'package:flutter/material.dart';
//widgets
import '../widgets/exercise_type/exercise_appbar.dart';
import '../widgets/exercise_type/exercise_item.dart';
//model
import '../../data/models/exercise/exercise.dart';
// screen
import '../screens/training.dart';

class ExerciseType extends StatefulWidget {
  static const routeName = "exercise_type";
  final List<Exercise> exercises;
  final String name;
  final String img;
  ExerciseType(this.name, this.img, this.exercises);

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
              name: widget.name,
              imgUrl: widget.img,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
              // margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '${widget.exercises.length * 20} mins',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.brightness_1, size: 5),
                  Text(
                    ' ${widget.exercises.length} Workouts',
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
            // Divider(),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Training.routeName,
                      arguments: widget.exercises);
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
