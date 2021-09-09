import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project/data/models/workout/workout.dart';
import 'package:project/logic/bloc/workout/workout.dart';
// bloc
import '../../logic/bloc/ticker/timer_bloc.dart';
// models
import '../../data/models/exercise/exercise.dart';
// widget
import '../widgets/training/congraModal.dart';

class Training extends StatefulWidget {
  static const routeName = "training";
  final Workout workout;
  const Training(this.workout, {Key? key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int _index = 0;
  void _showSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: BlocListener<TimerBloc, TimerState>(
          listener: (context, state) {
            if (state is TimerRunComplete) {
              context.read<TimerBloc>().add(TimerReset());
              context
                  .read<WorkoutBloc>()
                  .add(UpdateWorkout(_index, widget.workout));
              _showSnackBar("Keep up the good work! You got +20 points.");

              setState(() {
                if (_index + 1 < widget.workout.exercise.length) {
                  _index++;
                } else {
                  _showCongratulations(context);
                }
              });
            }
          },
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Container(
                  width: double.infinity,
                  child: Lottie.asset(
                    widget.workout.exercise[_index].lottieUrl,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Text(
                        widget.workout.exercise[_index].name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TimerText(),
                    SizedBox(height: 25),
                    Actions(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showCongratulations(BuildContext context) {
  showDialog(
      context: context, builder: (BuildContext context) => CongraModal());
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(
                      TimerStarted(duration: state.duration),
                    ),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: Icon(Icons.pause),
                onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                child: Icon(Icons.play_arrow),
                onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
              ),
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                child: Icon(Icons.replay),
                onPressed: () => context.read<TimerBloc>().add(TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}
