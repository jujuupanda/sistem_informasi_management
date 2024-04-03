import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/schedule_model.dart';
import '../../repositories/repository.dart';

part 'schedule_event.dart';

part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  Repository repository;

  ScheduleBloc({required this.repository}) : super(ScheduleInitialState()) {
    on<ScheduleInitialEvent>(_scheduleInitialEvent);
    on<ScheduleGetScheduleEvent>(_scheduleGetScheduleEvent);
  }

  _scheduleInitialEvent(ScheduleInitialEvent event, Emitter emit) {
    emit(ScheduleInitialState());
  }

  _scheduleGetScheduleEvent(
      ScheduleGetScheduleEvent event, Emitter emit) async {
    emit(ScheduleLoadingState());
    try {
      final token = await _getUserToken();
      final listSchedule =
          await repository.schedule.getSchedule(event.classId, token);
      emit(GetScheduleSuccessState(listSchedule));
    } catch (error) {
      emit(GetScheduleErrorState());
    }
  }

  ///Function for get token

  _getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
