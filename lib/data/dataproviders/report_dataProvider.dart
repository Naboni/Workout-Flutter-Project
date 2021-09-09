// models
import 'package:project/data/models/report/report.dart';
import '../models/workout/workout.dart';

import '../boxes.dart';

class ReportDataProvider {
  final _rbox = Boxes.getReport();

  Future<void> saveReport(int index, Workout workout) async {
    _rbox.add(
      Report()
        ..duration = 20
        ..point = 20
        ..execiseName = workout.exercise[index].name
        ..dateCreated = DateTime.now().toString(),
    );
  }

  Future<List<Report>> getReports() async {
    return _rbox.values.toList().cast<Report>();
  }
}
