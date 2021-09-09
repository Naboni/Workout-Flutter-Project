import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
// widgets
import '../widgets/home/workouts.dart';
import '../../presentation/widgets/home/stat.dart';
//bloc
import '../../logic/bloc/workout/workout.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    final _workouts = BlocProvider.of<WorkoutBloc>(context);
    _workouts.add(GetWorkouts());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mq.height * .25,
              child: Stack(
                children: [
                  Container(
                    height: mq.height * .15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFF70a8ff),
                            const Color(0xFF097bff),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                  Stat(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .01),
              child: BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (_, workoutState) {
                  if (workoutState is WorkoutInitial) {
                    return Container();
                  }
                  if (workoutState is WorkoutLoaded) {
                    final _workouts = workoutState.workouts;
                    return Workouts(_workouts);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
