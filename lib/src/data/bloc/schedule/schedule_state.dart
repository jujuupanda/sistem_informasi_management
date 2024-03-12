part of 'schedule_bloc.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();
}

class ScheduleInitialState extends ScheduleState {
  @override
  List<Object> get props => [];
}

class ScheduleLoadingState extends ScheduleState {
  @override
  List<Object> get props => [];
}

class GetScheduleSuccessState extends ScheduleState {
  final List<ScheduleModel> listSchedule;

  const GetScheduleSuccessState(this.listSchedule);

  @override
  List<Object> get props => [listSchedule];
}

class GetScheduleErrorState extends ScheduleState {
  @override
  List<Object> get props => [];
}
