import 'package:equatable/equatable.dart';
import 'package:project/data/models/workoutPlan/workoutPlan.dart';

abstract class TrainerWorkoutState extends Equatable {
  const TrainerWorkoutState();

  @override
  List<Object> get props => [];
}

class TrainerWorkoutInitial extends TrainerWorkoutState {}

class TrainerWorkoutLoaded extends TrainerWorkoutState {
  TrainerWorkoutLoaded(this.workoutPlans);
  final List<WorkoutPlan> workoutPlans;
}

class TrainerWorkoutFailed extends TrainerWorkoutState {}
