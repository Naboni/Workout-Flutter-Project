import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/user/user.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import 'package:project/presentation/screens/plan/add_plan.dart';

// widgets
import '../../widgets/plan/my_plan/plan_stat.dart';
import '../../widgets/plan/my_plan/plan_item.dart';
//bloc

class MyPlan extends StatefulWidget {
  static const routeName = "/myplan";
  final User user;
  MyPlan(this.user);
  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WorkoutPlanBloc>()..add(GetWorkoutPlanByTrainer());
    super.initState();
  }

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
          return Body(workoutplans, context);
        }
        return Container();
      },
    );
  }

  Container Body(WorkoutPlansResponse workoutplans, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PlanStat(workoutplans.plans!),
              SizedBox(height: 10),
              ValueBasedBody(workoutplans),
            ],
          ),
          Positioned(
            bottom: 5,
            right: 3,
            child: FloatingActionButton.extended(
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
          )
        ],
      ),
    );
  }

  Widget ValueBasedBody(WorkoutPlansResponse workoutplans) {
    var x = workoutplans.plans!;
    return workoutplans.plans!.length > 0
        ? Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => MyPlanItem(workoutplans.plans![index]),
              itemCount: workoutplans.plans!.length,
            ),
          )
        : Center(child: Text("No plans posted yet"));
  }
}
