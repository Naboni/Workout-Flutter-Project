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

    blocTest<ReportBloc, ReportState>(
      'emits [ReportInitial, Repor(report)] when successful',
      build: () {
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
