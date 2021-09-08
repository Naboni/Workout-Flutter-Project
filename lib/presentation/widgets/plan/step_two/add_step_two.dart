import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
// models
import 'package:project/data/models/workoutPlan/workoutPlan.dart';
// bloc
import '../../../../logic/bloc/trainer_workout/trainer_workout.dart';
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
  }

  bool _checkForValues() {
    bool _flag = false;
    for (var item in vals) {
      if ((item['exercises'] as List).length >= 1) {
        _flag = !_flag;
        // break the loop if true
        return _flag;
      }
    }
    return _flag;
  }

  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String value) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value)));
    }

    final trainerWorkoutBloc = BlocProvider.of<TrainerWorkoutBloc>(context);
    final workoutRepository = RepositoryProvider.of<WorkoutRepository>(context);
    final weekDays = stepResult['weekDays'] as List;

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
                    var d = vals
                        .where((element) =>
                            (element['exercises'] as List).length > 0)
                        .toList();
                    // print({...stepResult,'imgUrl': "abcd", 'date': "2020/12/12",'workouts': d});
                    if (_checkForValues())
                      trainerWorkoutBloc.add(AddTrainerWorkout(
                          WorkoutPlan.fromJson(stepResult, d)));
                    else
                      _showSnackBar("Please choose at least one exercise");
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
