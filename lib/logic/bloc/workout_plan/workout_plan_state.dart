part of 'workout_plan_bloc.dart';

abstract class WorkoutPlanState extends Equatable {
  const WorkoutPlanState();

  @override
  List<Object> get props => [];
}

class WorkoutPlanInitial extends WorkoutPlanState {}

class WorkoutPlanLoaded extends WorkoutPlanState {
  final WorkoutPlansResponse workoutResponse;
  WorkoutPlanLoaded(this.workoutResponse);
}

class WorkoutPlanFailed extends WorkoutPlanState {}
