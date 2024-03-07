import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'major_event.dart';
part 'major_state.dart';

class MajorBloc extends Bloc<MajorEvent, MajorState> {
  MajorBloc() : super(MajorInitial()) {
    on<MajorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
