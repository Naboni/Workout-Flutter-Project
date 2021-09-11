import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import '../widgets/feeds/feeds_item.dart';

class Feeds extends StatefulWidget {
  static const routeName = "/feeds";

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WorkoutPlanBloc>()..add(GetWorkoutPlan());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                key: Key('searchField'),
                onChanged: (value) => {
                  BlocProvider.of<WorkoutPlanBloc>(context)
                      .add(SearchPlan(value))
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20 * 0.75, horizontal: 20),
                  fillColor: Colors.white,
                  hintText: 'Search',
                  suffixIcon: Icon(
                    Icons.search,
                    size: 25.0,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<WorkoutPlanBloc, WorkoutPlanState>(
            builder: (context, state) {
              if (state is WorkoutPlanInitial) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is WorkoutPlanFailed) {
                return Center(child: Text("Sorry loading failed."));
              }
              if (state is WorkoutPlanSearchingFailed) {
                return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text("No workouts found."));
              }
              if (state is WorkoutPlanSearching) {
                return Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text("Searching..."));
              }
              if (state is WorkoutPlanLoaded) {
                final workoutplans = state.workoutResponse;
                return Body(workoutplans);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget Body(WorkoutPlansResponse workoutplans) {
    return ValueBasedBody(workoutplans);
  }

  Widget ValueBasedBody(WorkoutPlansResponse workoutplans) {
    return workoutplans.plans!.length > 0
        ? Column(children: [
            SizedBox(height: 10),
            ...workoutplans.plans!.map((e) => FeedsItem(e)).toList(),
          ])
        : Center(child: Text("No plans here."));
  }
}
