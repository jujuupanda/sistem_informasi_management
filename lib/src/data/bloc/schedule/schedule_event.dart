part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

class ScheduleInitialEvent extends ScheduleEvent {}

class ScheduleGetScheduleEvent extends ScheduleEvent {
  final int classId;

  const ScheduleGetScheduleEvent(this.classId);
}
