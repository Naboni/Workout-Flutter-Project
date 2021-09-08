import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
// repository
import '../../../../data/repositories/workout_repository.dart';
import 'package:project/data/models/exercise/exercise.dart';
// widgets
import 'exercise_selector.dart';

//  ! ADD PARENT TITLE TO THE EXERCISE SO THAT IT CAN BE FILTERED WITH TARGET MUSCLES ALSO ADD DIFICULTY

class StepTwo extends StatelessWidget {
  final Map<dynamic, dynamic> stepResult;
  StepTwo(this.stepResult, {Key? key}) : super(key: key);

  List<Map<String, Object>> vals =
      List.generate(7, (index) => {"day": index, "exercises": []});

  _fillDay(int dayIndex, List<dynamic> listEx) {
    vals[dayIndex]['exercises'] = listEx;
    print(vals);
  }

  @override
  Widget build(BuildContext context) {
    final workoutRepository = RepositoryProvider.of<WorkoutRepository>(context);
    final weekDays = stepResult['weekDays'] as List;
    print(stepResult);

    return FutureBuilder(
      future: workoutRepository.getExercises(stepResult),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          var listOfExercises = snapshot.data as List<Exercise>;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose exercises for selected days",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 15),
                ...weekDays.map(
                    (day) => ExerciseSelector(day, listOfExercises, _fillDay)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print("object");
                  },
                  child: Container(
                      height: 50, child: Center(child: Text("Finish"))),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
