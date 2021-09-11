import 'package:project/data/dataproviders/report_dataProvider.dart';
// models
import '../models/workout/workout.dart';
import 'package:project/data/models/report/report.dart';

class ReportRepository {
  final reportDataProvider = ReportDataProvider();

  Future<List<Report>>? getReport() async {
    return await reportDataProvider.getReports();
  }

  Future<void>? addReport(int index, Workout workout) async {
    await reportDataProvider.saveReport(index, workout);
  }
}
