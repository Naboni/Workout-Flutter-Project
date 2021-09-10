import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import 'package:project/presentation/screens/plan/add_plan.dart';

// widgets
import '../../widgets/plan/my_plan/plan_stat.dart';
import '../../widgets/plan/my_plan/plan_item.dart';
//bloc

class MyPlan extends StatefulWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/myplan";

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutPlanBloc, WorkoutPlanState>(
      builder: (context, state) {
        if (state is WorkoutPlanInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WorkoutPlanFailed) {
          return Text("Sorry loading failed");
        }
        if (state is WorkoutPlanLoaded) {
          final workoutplans = state.workoutResponse;
          if (workoutplans.plans!.length == 0) {
            return Center(child: Text("You dont have any plans posted."));
          }
          return Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PlanStat(workoutplans.plans!),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) =>
                        MyPlanItem(workoutplans.plans![index]),
                    itemCount: workoutplans.plans!.length,
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    // ! provide an already existing bloc instance!!!!!
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => BlocProvider.value(
                          value: BlocProvider.of<WorkoutPlanBloc>(context),
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
