part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class EventInitialEvent extends EventEvent {}

class EventGetEventForUserEvent extends EventEvent {}

class EventGetEventForAdminEvent extends EventEvent {}

class EventAddEventForAdminEvent extends EventEvent {}
