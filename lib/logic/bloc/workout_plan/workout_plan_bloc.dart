import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/data/repositories/workout_plan_repository.dart';

part 'workout_plan_event.dart';
part 'workout_plan_state.dart';

class WorkoutPlanBloc extends Bloc<WorkoutPlanEvent, WorkoutPlanState> {
  final WorkoutPlanRepository workotPlanRepository;
  WorkoutPlanBloc(this.workotPlanRepository) : super(WorkoutPlanInitial());

  @override
  Stream<WorkoutPlanState> mapEventToState(
    WorkoutPlanEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetWorkoutPlan) {
      yield WorkoutPlanInitial();
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlans();
      yield WorkoutPlanLoaded(workoutResponse);
    }

    if (event is GetWorkoutPlanByTrainer) {
      yield WorkoutPlanInitial();
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlansByTrainer();
      yield WorkoutPlanLoaded(workoutResponse);
    }

    if (event is AddWorkoutPlan) {
      final workoutPlan = event.workoutPlan;
      yield WorkoutPlanAdding();
      final WorkoutPlan? workoutResponse =
          await workotPlanRepository.addWorkoutPlan(workoutPlan);
      if (workoutResponse == null) {
        yield WorkoutPlanAddingFailed();
      } else {
        yield WorkoutPlanAddingSucceded();
        final WorkoutPlansResponse workoutResponse =
            await workotPlanRepository.getWorkoutPlansByTrainer();
        yield WorkoutPlanLoaded(workoutResponse);
      }
    }
    if (event is DeleteWorkoutPlan) {
      final workoutPlanId = event.planId;
      // add repo
      // get again
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
  }
}
