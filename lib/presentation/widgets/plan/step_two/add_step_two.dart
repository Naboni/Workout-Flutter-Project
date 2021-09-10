import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
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

    final workoutPlanBloc = BlocProvider.of<WorkoutPlanBloc>(context);
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
                    print({
                      ...stepResult,
                      'imgUrl': "abcd",
                      'date': "2020/12/12",
                      'workouts': d
                    });
                    if (_checkForValues())
                      // !!!!!!!!!!!!!!!! step result doesnt hv full items
                      workoutPlanBloc.add(AddWorkoutPlan(WorkoutPlan.fromJson({
                        ...stepResult,
                        'workouts': d,
                        'imgUrl': "abcd",
                      })));
                    else
                      _showSnackBar("Please choose at least one exercise");
                  },
                  child: BlocConsumer<WorkoutPlanBloc, WorkoutPlanState>(
                    listener: (context, state) {
                      if (state is WorkoutPlanAddingSucceded) {
                        Navigator.of(context).pop();
                        _showSnackBar("Successfully added a new plan.");
                      }
                      if (state is WorkoutPlanAddingFailed) {
                        _showSnackBar("Something went wrong");
                      }
                    },
                    builder: (context, state) {
                      if (state is WorkoutPlanAdding) {
                        return Container(
                            height: 50,
                            child: Center(child: Text("Loading...")));
                      }
                      return Container(
                          height: 50, child: Center(child: Text("Finish")));
                    },
                  ),
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
