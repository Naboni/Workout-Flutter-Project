import 'package:flutter/material.dart';

// models
import 'package:project/data/models/workout/workout.dart';
//screen
import '../../screens/exercise_type.dart';
// widgets
import 'workout_progress.dart';

class WorkoutsListItem extends StatelessWidget {
  final Workout workout;

  WorkoutsListItem(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _CompletedExList = workout.exercise.where((element) => element.isDone);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExerciseType.routeName,
          arguments: workout,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage('${workout.imgUrl}'),
                    fit: BoxFit.cover,
                  )),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.2),
                    ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${workout.name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    WorkoutProgress(
                        _CompletedExList.length, workout.exercise.length),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
