// deps
import 'package:equatable/equatable.dart';
// model
import '../../../data/models/workout/workout.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoaded extends WorkoutState {
  final List<Workout> workouts;
  WorkoutLoaded(this.workouts);
}
