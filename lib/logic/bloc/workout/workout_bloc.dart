import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project/data/repositories/workout_repository.dart';

import 'workout.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutBloc(this.workoutRepository) : super(WorkoutInitial());
  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWorkouts) {
      yield WorkoutInitial();
      final _workouts = await workoutRepository.getWorkouts();
      yield WorkoutLoaded(_workouts!);
    }
    if (event is UpdateWorkout) {
      final index = event.index;
      final workout = event.workout;
      await workoutRepository.updateWorkout(index, workout);
    }
  }
}
