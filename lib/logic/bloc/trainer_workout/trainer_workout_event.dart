import 'package:equatable/equatable.dart';
import 'package:project/data/models/workoutPlan/workoutPlan.dart';

abstract class TrainerWorkoutEvent extends Equatable {
  const TrainerWorkoutEvent();

  @override
  List<Object> get props => [];
}

class GetTrainerWorkouts extends TrainerWorkoutEvent {}

class AddTrainerWorkout extends TrainerWorkoutEvent {
  final WorkoutPlan trainerWorkout;
  AddTrainerWorkout(this.trainerWorkout);
}

class DeleteTrainerWorkout extends TrainerWorkoutEvent {
  final WorkoutPlan trainerWorkout;
  DeleteTrainerWorkout(this.trainerWorkout);
}
