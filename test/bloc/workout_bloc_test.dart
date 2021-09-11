import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/models/exercise/exercise.dart';
// import 'package:project/data/models/reminder/reminder.dart';
import 'package:project/data/models/workout/workout.dart';
// import 'package:project/data/repositories/reminder_repository.dart';
import 'package:project/data/repositories/workout_repository.dart';
// import 'package:project/logic/bloc/reminder/reminder_bloc.dart';
import 'package:project/logic/bloc/workout/workout_bloc.dart';
import 'package:project/logic/bloc/workout/workout_event.dart';
import 'package:project/logic/bloc/workout/workout_state.dart';

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

void main() {
  MockWorkoutRepository mockWorkoutRepository;
  mockWorkoutRepository = MockWorkoutRepository();
  setUp(() {});
  group('Get Reports', () {
    List<Exercise> exercise = [
      Exercise()
        ..id = "0"
        ..name = "PLANK EXERCISE"
        ..duration = "20"
        ..lottieUrl = "assets/anim/workouts/abs/plank-excercise.json"
        ..category = "abs"
        ..description =
            "The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time."
        ..difficulty = "hard"
        ..isDone = false
    ];
    List<Workout> workouts = [
      Workout()
        ..id = "0"
        ..name = "ABS"
        ..imgUrl = "assets/images/asd.jpg"
        ..exercise = exercise,
      Workout()
        ..id = "0"
        ..name = "ABS"
        ..imgUrl = "assets/images/asd.jpg"
        ..exercise = exercise
    ];

    blocTest<WorkoutBloc, WorkoutState>(
      'emits [WorkoutInitial(), WorkoutLoaded(workouts)] when successful',
      build: () {
        when(mockWorkoutRepository.getWorkouts())
            .thenAnswer((_) async => workouts);
        return WorkoutBloc(mockWorkoutRepository);
      },
      act: (bloc) {
        bloc.add(GetWorkouts());
      },
      expect: () => [
        WorkoutInitial(),
        WorkoutLoaded(workouts),
      ],
    );
  });
}
