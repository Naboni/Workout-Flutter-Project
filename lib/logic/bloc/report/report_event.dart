part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class GetReport extends ReportEvent {}

class SaveReport extends ReportEvent {
  final Workout workout;
  final int index;
  SaveReport(this.index, this.workout);
}
