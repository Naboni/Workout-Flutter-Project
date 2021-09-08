import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project/data/repositories/workoutPlan_repository.dart';
import 'trainer_workout.dart';

class TrainerWorkoutBloc
    extends Bloc<TrainerWorkoutEvent, TrainerWorkoutState> {
  final WorkotPlanRepository workotPlanRepository;
  TrainerWorkoutBloc(this.workotPlanRepository)
      : super(TrainerWorkoutInitial());

  @override
  Stream<TrainerWorkoutState> mapEventToState(
    TrainerWorkoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetTrainerWorkouts) {
      yield TrainerWorkoutInitial();
      // fetch from repo
      final workoutPlans = await workotPlanRepository.getWorkoutPlans();
      yield TrainerWorkoutLoaded(workoutPlans);
    }
    if (event is AddTrainerWorkout) {
      final trainerworkout = event.trainerWorkout;
      // add repo
      // get again
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
    if (event is DeleteTrainerWorkout) {
      final workout = event.trainerWorkout;
      // add repo
      // get again
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
  }
}
