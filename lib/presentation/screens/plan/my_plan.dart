import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/presentation/screens/plan/add_plan.dart';

// widgets
import '../../widgets/plan/my_plan/plan_stat.dart';
import '../../widgets/plan/my_plan/plan_item.dart';
//bloc
import '../../../logic/bloc/trainer_workout/trainer_workout.dart';

class MyPlan extends StatefulWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/myplan";

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerWorkoutBloc, TrainerWorkoutState>(
      builder: (context, state) {
        if (state is TrainerWorkoutInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TrainerWorkoutFailed) {
          return Text("Sorry loading failed");
        }
        if (state is TrainerWorkoutLoaded) {
          final workoutplans = state.workoutPlans;
          if (workoutplans.length == 0) {
            return Center(child: Text("You dont have any plans posted."));
          }
          return Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PlanStat(workoutplans),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) => MyPlanItem(workoutplans[index]),
                    itemCount: workoutplans.length,
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    // ! provide an already existing bloc instance!!!!!
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => BlocProvider.value(
                          value: BlocProvider.of<TrainerWorkoutBloc>(context),
                          child: AddPlan(),
                        ),
                      ),
                    );
                  },
                  label: Row(
                    children: [Icon(Icons.add), Text('ADD NEW PLAN')],
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
