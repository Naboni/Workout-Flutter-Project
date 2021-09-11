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

    if (event is GetWorkoutPlanByTrainee) {
      yield WorkoutPlanInitial();
      final List<WorkoutPlan>? workoutResponse =
          await workotPlanRepository.getFavoredPlans();
      yield WorkoutPlansLoaded(workoutResponse!);
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
      yield WorkoutPlanDelete();
      final workoutPlanId = event.planId;
      final bool workoutRes =
          await workotPlanRepository.deleteWorkoutPlan(workoutPlanId);
      if (!workoutRes) {
        yield WorkoutPlanDeleteFailed();
      } else {
        yield WorkoutPlanDeleteSucceded();
      }
      yield WorkoutPlanInitial();
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlansByTrainer();
      yield WorkoutPlanLoaded(workoutResponse);
    }

    if (event is FavorWorkoutPlan) {
      yield WorkoutPlanFavoring();
      final workoutPlanId = event.planId;
      final bool workoutRes =
          await workotPlanRepository.favorWorkoutPlan(workoutPlanId);
      if (!workoutRes) {
        yield WorkoutPlanFavoringFailed();
      } else {
        yield WorkoutPlanFavoringSucceded();
      }
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlans();
      yield WorkoutPlanLoaded(workoutResponse);
    }

    if (event is UnfavorWorkoutPlan) {
      yield WorkoutPlanFavoring();
      final workoutPlanId = event.planId;
      final bool workoutRes =
          await workotPlanRepository.unfavorWorkoutPlan(workoutPlanId);
      if (!workoutRes) {
        yield WorkoutPlanFavoringFailed();
      } else {
        yield WorkoutPlanFavoringSucceded();
      }
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.getWorkoutPlans();
      yield WorkoutPlanLoaded(workoutResponse);
    }

    // search
    if (event is SearchPlan) {
      yield WorkoutPlanSearching();
      final title = event.title;
      final WorkoutPlansResponse workoutResponse =
          await workotPlanRepository.searchWorkoutPlans(title);
      if (workoutResponse.plans!.length == 0) {
        yield WorkoutPlanSearchingFailed();
      } else {
        yield WorkoutPlanLoaded(workoutResponse);
      }
    }
  }
}
