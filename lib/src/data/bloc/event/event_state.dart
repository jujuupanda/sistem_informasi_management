part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class EventInitialState extends EventState {
  @override
  List<Object> get props => [];
}

class EventLoadingState extends EventState {
  @override
  List<Object> get props => [];
}

class EventGetEventSuccessState extends EventState {
  final List<EventModel> listEvents;

  const EventGetEventSuccessState(this.listEvents);

  @override
  List<Object> get props => [listEvents];
}

class EventGetEventErrorState extends EventState {
  @override
  List<Object> get props => [];
}

class EventAddEventSuccessState extends EventState {
  @override
  List<Object> get props => [];
}

class EventAddEventErrorState extends EventState {
  @override
  List<Object> get props => [];
}
