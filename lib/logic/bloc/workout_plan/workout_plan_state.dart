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

// add
class WorkoutPlanAdding extends WorkoutPlanState {}

class WorkoutPlanAddingSucceded extends WorkoutPlanState {}

class WorkoutPlanAddingFailed extends WorkoutPlanState {}

// favor
class WorkoutPlanFavoring extends WorkoutPlanState {}

class WorkoutPlanFavoringSucceded extends WorkoutPlanState {}

class WorkoutPlanFavoringFailed extends WorkoutPlanState {}

// search
class WorkoutPlanSearching extends WorkoutPlanState {}

class WorkoutPlanSearchingFailed extends WorkoutPlanState {}
// delete

class WorkoutPlanDelete extends WorkoutPlanState {}

class WorkoutPlanDeleteSucceded extends WorkoutPlanState {}

class WorkoutPlanDeleteFailed extends WorkoutPlanState {}
