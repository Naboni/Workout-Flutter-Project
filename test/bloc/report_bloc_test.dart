import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/data/models/report/report.dart';
// import 'package:project/data/models/workout/workout.dart';
import 'package:project/data/repositories/report_repository.dart';
import 'package:project/logic/bloc/report/report_bloc.dart';

class MockReportRepository extends Mock implements ReportRepository {}

void main() {
  MockReportRepository mockReportRepository;
  mockReportRepository = MockReportRepository();
  setUp(() {});
  group('Get Reports', () {
    List<Report> reports = [
      Report()
        ..duration = 20
        ..point = 20
        ..execiseName = 'Exercise'
        ..dateCreated = DateTime.now().toString(),
      Report()
        ..duration = 20
        ..point = 20
        ..execiseName = 'Exercise'
        ..dateCreated = DateTime.now().toString(),
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

    blocTest<ReportBloc, ReportState>(
      'emits [ReportInitial, Repor(report)] when successful',
      build: () {
        // when(mockReportRepository.addReport(1, workout))
        //     .thenAnswer((_) async => reports.add(report));
        when(mockReportRepository.getReport()).thenAnswer((_) async => reports);
        return ReportBloc(mockReportRepository);
      },
      act: (bloc) {
        bloc.add(GetReport());
      },
      expect: () => [
        ReportInitial(),
        Repor(reports),
      ],
    );
  });
}
