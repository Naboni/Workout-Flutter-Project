import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:project/data/models/exercise/exercise.dart';
// import 'package:project/data/models/reminder/reminder.dart';
// import 'package:project/data/models/workout/workout.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/data/repositories/workout_plan_repository.dart';
// import 'package:project/data/repositories/reminder_repository.dart';
// import 'package:project/data/repositories/workout_repository.dart';
// import 'package:project/logic/bloc/reminder/reminder_bloc.dart';
// import 'package:project/logic/bloc/workout/workout_bloc.dart';
// import 'package:project/logic/bloc/workout/workout_event.dart';
// import 'package:project/logic/bloc/workout/workout_state.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';

class MockWorkoutPlanRepository extends Mock implements WorkoutPlanRepository {}

void main() {
  MockWorkoutPlanRepository mockWorkoutPlanRepository;
  mockWorkoutPlanRepository = MockWorkoutPlanRepository();
  setUp(() {});
  group('Get Workouts', () {
    List<WorkoutPlan> workoutplans = [
      WorkoutPlan()
        ..id = "0"
        ..age = "18"
        ..imgUrl = "assets/images/asd.jpg"
        ..title = "best exercise"
        ..description = "this is a good plan",
      WorkoutPlan()
        ..id = "1"
        ..age = "28"
        ..imgUrl = "assets/images/asd.jpg"
        ..title = "great exercise"
        ..description = "this is a great plan",
    ];
    WorkoutPlansResponse workoutResponse = WorkoutPlansResponse()
      ..plans = workoutplans;

    blocTest<WorkoutPlanBloc, WorkoutPlanState>(
      'emits [WorkoutPlanInitial()] when successful',
      build: () {
        when(mockWorkoutPlanRepository.getFavoredPlans())
            .thenAnswer((_) async => workoutplans);
        return WorkoutPlanBloc(mockWorkoutPlanRepository);
      },
      act: (bloc) {
        bloc.add(GetWorkoutPlan());
      },
      expect: () => [
        WorkoutPlanInitial(),
      ],
    );

    blocTest<WorkoutPlanBloc, WorkoutPlanState>(
      'emits [WorkoutPlanInitial, WorkoutPlanLoaded(WorkoutPlanLoaded)] when successful',
      build: () {
        when(mockWorkoutPlanRepository.getWorkoutPlans())
            .thenAnswer((_) async => workoutResponse);
        return WorkoutPlanBloc(mockWorkoutPlanRepository);
      },
      act: (bloc) {
        bloc.add(GetWorkoutPlan());
      },
      expect: () => [
        WorkoutPlanInitial(),
        WorkoutPlanLoaded(workoutResponse),
      ],
    );

    blocTest<WorkoutPlanBloc, WorkoutPlanState>(
      'emits [WorkoutPlanInitial, WorkoutPlanLoaded(workoutResponse)] when successful',
      build: () {
        when(mockWorkoutPlanRepository.getWorkoutPlansByTrainer())
            .thenAnswer((_) async => workoutResponse);
        return WorkoutPlanBloc(mockWorkoutPlanRepository);
      },
      act: (bloc) {
        bloc.add(GetWorkoutPlanByTrainer());
      },
      expect: () => [
        WorkoutPlanInitial(),
        WorkoutPlanLoaded(workoutResponse),
      ],
    );
  });

  group('Add Workouts', () {
    List<WorkoutPlan> workoutplans = [
      WorkoutPlan()
        ..id = "0"
        ..age = "18"
        ..imgUrl = "assets/images/asd.jpg"
        ..title = "best exercise"
        ..description = "this is a good plan",
      WorkoutPlan()
        ..id = "1"
        ..age = "28"
        ..imgUrl = "assets/images/asd.jpg"
        ..title = "great exercise"
        ..description = "this is a great plan",
    ];
    WorkoutPlan workoutPlan = WorkoutPlan()
      ..id = "0"
      ..age = "18"
      ..imgUrl = "assets/images/asd.jpg"
      ..title = "best exercise"
      ..description = "this is a good plan";
    String id = '0';
    WorkoutPlansResponse workoutResponse = WorkoutPlansResponse()
      ..plans = workoutplans;
    blocTest<WorkoutPlanBloc, WorkoutPlanState>(
      'emits [WorkoutPlanAdding(), WorkoutPlanAdding(workoutResponse)] when it fails',
      build: () {
        when(mockWorkoutPlanRepository.addWorkoutPlan(workoutPlan))
            .thenAnswer((_) async {
          workoutplans.add(workoutPlan);
        });
        when(mockWorkoutPlanRepository.getWorkoutPlan(id))
            .thenAnswer((_) async => workoutPlan);
        return WorkoutPlanBloc(mockWorkoutPlanRepository);
      },
      act: (bloc) {
        bloc.add(AddWorkoutPlan(workoutPlan));
      },
      expect: () => [
        WorkoutPlanAdding(),
        WorkoutPlanAddingFailed(),
        // WorkoutPlanAdding(workoutResponse),
      ],
    );
  });
}
