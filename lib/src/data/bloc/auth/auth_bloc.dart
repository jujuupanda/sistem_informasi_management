export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository repository;

  AuthBloc({required this.repository}) : super(AuthInitialState()) {
    on<AuthInitialEvent>(_authInitialEvent);
    on<AuthorizationEvent>(_authorizationEvent);
    on<AuthLoginEvent>(_authLoginEvent);
  }

  _authInitialEvent(AuthInitialEvent event, Emitter emit) {
    emit(AuthInitialState());
  }

  _authorizationEvent(AuthorizationEvent event, Emitter emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString("token");

    if (userToken != null) {
      emit(IsAuthorizedState());
    } else {
      emit(UnAuthorizedState());
    }
  }

  _authLoginEvent(AuthLoginEvent event, Emitter emit) async {
    emit(AuthLoadingState());
    try {
      await repository.auth.login(event.username, event.password);
      // final role = repository.auth.decodeJwt(user);
      if (repository.auth.token != "") {
        _saveUserToken(repository.auth.token);
        emit(AuthLoginSuccessState());
      } else {
        emit(AuthLoginErrorState(repository.auth.error));
      }
    } catch (err) {
      print(err);
    }
  }

  //Function for save token after success login
  _saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userToken = repository.auth.decodedJWT(token);
    await prefs.setString("token", token);
    await prefs.setString("role", userToken["role"]);
  }

  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString("token");

    if (userToken != "") {
      return 1;
    } else {
      return 0;
    }
  }
}
