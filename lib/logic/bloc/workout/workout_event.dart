import 'package:equatable/equatable.dart';
import 'package:project/data/models/workout/workout.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class GetWorkouts extends WorkoutEvent {}

class UpdateWorkout extends WorkoutEvent {
  final Workout workout;
  final int index;
  UpdateWorkout(this.index, this.workout);
}
