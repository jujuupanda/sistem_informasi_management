import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../../repositories/repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  Repository repository;

  UserBloc({required this.repository}) : super(UserInitialState()) {
    on<UserInitialEvent>(_userInitialEvent);
    on<UserGetUserEvent>(_userGetUserEvent);
  }

  _userInitialEvent(UserInitialEvent event, Emitter emit) {
    emit(UserInitialState());
  }

  _userGetUserEvent(UserGetUserEvent event, Emitter emit) async {
    emit(UserLoadingState());
    try {
      final token = await _getUserToken();
      final username = await _getUserUsername();
      final role = await _getUserRole();
      final userData = await repository.user.getUser(
        username,
        role,
        token,
      );
      emit(UserGetUserSuccessState(userData));
    } catch (error) {
      emit(UserGetUserErrorState());
    }
  }

  ///Function for get token

  _getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  _getUserUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  _getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("role");
  }
}
