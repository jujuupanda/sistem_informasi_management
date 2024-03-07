
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
    on<UserAddUserEvent>(_userAddUserEvent);
  }

  _userInitialEvent(UserInitialEvent event, Emitter emit) {
    emit(UserInitialState());
  }

  _userAddUserEvent(UserAddUserEvent event, Emitter emit) async {
    emit(UserLoadingState());
    try {
      await repository.user.addUser(
        event.username,
        event.password,
        event.name,
        event.role,
      );
      if (repository.user.error == "") {
        emit(UserAddUserSuccessState());
      } else {
        emit(UserAddUserErrorState(repository.user.error));
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  _userGetUserEvent(UserGetUserEvent event, Emitter emit) async {
    emit(UserLoadingState());
    try {
      final token = await _getUserToken();
      final username = await _getUserUsername();
      final userData = await repository.user.getUser(
        username,
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
