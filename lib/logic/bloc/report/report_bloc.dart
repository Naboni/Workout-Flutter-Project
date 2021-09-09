import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project/data/models/report/report.dart';
import 'package:project/data/models/workout/workout.dart';
import 'package:project/data/repositories/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial());
  final reportRepository = ReportRepository();
  @override
  Stream<ReportState> mapEventToState(
    ReportEvent event,
  ) async* {
    if (event is GetReport) {
      yield ReportInitial();
      final report = await reportRepository.getReport();
      yield Repor(report);
    }
    if (event is SaveReport) {
      final index = event.index;
      final workout = event.workout;
      await reportRepository.addReport(index, workout);
    }
  }
}
