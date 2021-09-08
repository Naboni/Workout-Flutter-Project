import 'dart:async';
import 'package:bloc/bloc.dart';
import 'trainer_workout.dart';

class TrainerWorkoutBloc
    extends Bloc<TrainerWorkoutEvent, TrainerWorkoutState> {
  TrainerWorkoutBloc() : super(TrainerWorkoutInitial());

  @override
  Stream<TrainerWorkoutState> mapEventToState(
    TrainerWorkoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetTrainerWorkouts) {
      yield TrainerWorkoutInitial();
      // fetch from repo
      // yield TrainerWorkoutLoaded(workoutPlans);
    }
    if (event is AddTrainerWorkout) {
      final workout = event.trainerWorkout;
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
