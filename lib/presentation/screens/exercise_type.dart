import 'package:flutter/material.dart';
import '_routes.dart';
import '../widgets/exercise_type/exercise_appbar.dart';
import '../widgets/exercise_type/exercise_footer.dart';
import '../widgets/exercise_type/specific_exercise.dart';

class ExerciseType extends StatelessWidget {
  // const ExerciseType({Key? key}) : super(key: key);
  static const routeName = "exercise_type";

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
                      return SpecificExercise();
                    },
                    itemCount: 10,
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
