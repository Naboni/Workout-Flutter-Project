import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project/data/repositories/workout_repository.dart';

import 'workout.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutInitial());
  final workoutRepository = WorkoutRepository();
  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWorkouts) {
      yield WorkoutInitial();
      final _workouts = await workoutRepository.getWorkouts();
      yield WorkoutLoaded(_workouts);
    }
  }
}
