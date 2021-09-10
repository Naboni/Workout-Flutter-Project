part of 'workout_plan_bloc.dart';

abstract class WorkoutPlanEvent extends Equatable {
  const WorkoutPlanEvent();

  @override
  List<Object> get props => [];
}

class GetWorkoutPlan extends WorkoutPlanEvent {}

class GetWorkoutPlanByTrainer extends WorkoutPlanEvent {}

class AddWorkoutPlan extends WorkoutPlanEvent {
  final WorkoutPlan workoutPlan;
  AddWorkoutPlan(this.workoutPlan);
}

class DeleteWorkoutPlan extends WorkoutPlanEvent {
  final String planId;
  DeleteWorkoutPlan(this.planId);
}

class FavorWorkoutPlan extends WorkoutPlanEvent {
  final String planId;
  FavorWorkoutPlan(this.planId);
}

class SearchPlan extends WorkoutPlanEvent {
  final String title;
  SearchPlan(this.title);
}
