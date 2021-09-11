import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:project/data/models/reminder/reminder.dart';
import 'package:project/data/repositories/reminder_repository.dart';
import 'package:project/logic/bloc/reminder/reminder_bloc.dart';

class MockReminderRepository extends Mock implements ReminderRepository {}

void main() {
  MockReminderRepository mockReminderRepository;
  mockReminderRepository = MockReminderRepository();
  setUp(() {});
  group('Get Reports', () {
    List<Reminder> reminders = [
      Reminder()
        ..time = '2'
        ..days = [1, 2],
      Reminder()
        ..time = '2'
        ..days = [1, 2]
    ];
    // final report = Report()
    //   ..duration = 20
    //   ..point = 20
    //   ..execiseName = 'Exercisess'
    //   ..dateCreated = DateTime.now().toString();
    // List<Exercise> exercise = [
    //   Exercise()
    //     ..id = "0"
    //     ..name = "PLANK EXERCISE"
    //     ..duration = "20"
    //     ..lottieUrl = "assets/anim/workouts/abs/plank-excercise.json"
    //     ..category = "abs"
    //     ..description =
    //         "The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time."
    //     ..difficulty = "hard"
    //     ..isDone = false
    // ];
    // final workout = Workout()
    //   ..id = "0"
    //   ..name = "ABS"
    //   ..imgUrl = "assets/images/asd.jpg"
    //   ..exercise = exercise;

    blocTest<ReminderBloc, ReminderState>(
      'emits [ReportInitial, Repor(report)] when successful',
      build: () {
        // when(mockReminderRepository.addReport(1, workout))
        //     .thenAnswer((_) async => reports.add(report));
        when(mockReminderRepository.getReminders())
            .thenAnswer((_) async => reminders);
        return ReminderBloc(mockReminderRepository);
      },
      act: (bloc) {
        bloc.add(GetReminders());
      },
      expect: () => [
        ReminderInitial(),
        ReminderLoaded(reminders),
      ],
    );
  });
}
