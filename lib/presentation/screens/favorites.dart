import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import 'package:project/presentation/screens/navigation_drawer.dart';
import 'package:project/presentation/widgets/feeds/feeds_item.dart';

class Favorites extends StatefulWidget {
  static const routeName = "/favorites";
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WorkoutPlanBloc>()..add(GetWorkoutPlanByTrainee());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('FAVORITES'),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: BlocBuilder<WorkoutPlanBloc, WorkoutPlanState>(
        builder: (context, state) {
          if (state is WorkoutPlanInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is WorkoutPlansLoaded) {
            final workouts = state.workoutResponse;
            if (workouts.length == 0) {
              return Center(child: Text('No favorites yet'));
            }
            return ListView.builder(
              itemBuilder: (_, index) => FeedsItem(workouts[index]),
              itemCount: workouts.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
