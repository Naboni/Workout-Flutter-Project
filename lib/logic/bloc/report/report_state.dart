part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class Repor extends ReportState {
  final List<Report> report;
  Repor(this.report);
}
