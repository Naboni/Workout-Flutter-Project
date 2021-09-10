part of 'workout_plan_bloc.dart';

abstract class WorkoutPlanState extends Equatable {
  const WorkoutPlanState();

  @override
  List<Object> get props => [];
}

class WorkoutPlanInitial extends WorkoutPlanState {}

class WorkoutPlanLoaded extends WorkoutPlanInitial {
  WorkoutPlanLoaded(this.workoutResponse);
  final WorkoutResponse workoutResponse;
}

class WorkoutPlanFailed extends WorkoutPlanInitial {}
