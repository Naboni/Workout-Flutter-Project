part of 'workout_plan_bloc.dart';

abstract class WorkoutPlanEvent extends Equatable {
  const WorkoutPlanEvent();

  @override
  List<Object> get props => [];
}

class GetWorkoutPlan extends WorkoutPlanEvent {}

class AddWorkoutPlan extends WorkoutPlanEvent {
  final Plan workoutPlan;
  AddWorkoutPlan(this.workoutPlan);
}

class DeleteWorkoutPlan extends WorkoutPlanEvent {
  final String planId;
  DeleteWorkoutPlan(this.planId);
}
