import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/event_model.dart';
import '../../repositories/repository.dart';

part 'event_event.dart';

part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  Repository repository;

  EventBloc({required this.repository}) : super(EventInitialState()) {
    on<EventInitialEvent>(_eventInitialEvent);
    on<EventGetEventForUserEvent>(_eventGetEventForUserEvent);
    on<EventGetEventForAdminEvent>(_eventGetEventForAdminEvent);
    on<EventAddEventForAdminEvent>(_eventAddEventForAdminEvent);
  }

  _eventInitialEvent(EventInitialEvent event, Emitter emit) {
    emit(EventInitialEvent());
  }

  _eventGetEventForUserEvent(EventGetEventForUserEvent event, Emitter emit) async {
    emit(EventLoadingState());
    try {
      final listEvents = await repository.event.getEventForUser();
      emit(EventGetEventSuccessState(listEvents));
    } catch (error) {
      emit(EventGetEventErrorState());
    }
  }

  _eventGetEventForAdminEvent(EventGetEventForAdminEvent event, Emitter emit) {}

  _eventAddEventForAdminEvent(EventAddEventForAdminEvent event, Emitter emit) {}
}
