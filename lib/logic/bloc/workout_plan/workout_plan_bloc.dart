import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/data/models/workoutPlan/workout_plan_new/workout_plan.dart';
import 'package:project/data/models/workoutPlan/workout_plan_new/workout_response.dart';
import 'package:project/data/repositories/workout_plan_repository.dart';

part 'workout_plan_event.dart';
part 'workout_plan_state.dart';

class WorkoutPlanBloc extends Bloc<WorkoutPlanEvent, WorkoutPlanState> {
  final WorkotPlanRepository workotPlanRepository;
  WorkoutPlanBloc(this.workotPlanRepository) : super(WorkoutPlanInitial());

  @override
  Stream<WorkoutPlanState> mapEventToState(
    WorkoutPlanEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWorkoutPlan) {
      yield WorkoutPlanInitial();
      // fetch from repo
      final WorkoutResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlans();
      yield WorkoutPlanLoaded(workoutResponse);
    }
    if (event is AddWorkoutPlan) {
      final workoutPlan = event.workoutPlan;
      // add repo
      // get again
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
    if (event is DeleteWorkoutPlan) {
      final workoutPlanId = event.planId;
      // add repo
      // get again
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
  }
}
